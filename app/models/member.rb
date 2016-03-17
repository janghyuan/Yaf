class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :avatar_size

  has_many :topics
  has_many :replies
  has_many :notifications

  mount_uploader :avatar, AvatarUploader

  def unread_messages
  	Notification.where(member_id: id, unread: true)
  end

  def collection_count
    collection.to_s.split(",").count
  end


  private
  	def avatar_size
  		if avatar.size > 5.megabytes
  			errors.add(:avatar, "图片不能超过 5 MB")
  		end
  	end
end

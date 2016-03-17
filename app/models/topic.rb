class Topic < ActiveRecord::Base
	before_save :wrap_link_to_names
  after_save :send_notification
  before_save :update_last_modified
	default_scope -> { order(last_modified: :desc) }

	validates :title, presence: true
  validates :node_id, presence: true

	belongs_to :member
  belongs_to :node
	has_many :replies

  
  def Topic.popular
    Topic.where("created_at > ?", 1.day.ago.localtime).find_all { |topic| topic.replies.count > 1 }
  end

	private
  	def wrap_link_to_names
  		body.gsub! /@\w+/ do |m|
  			member_name = m[1..-1]
  			if member = Member.find_by(name: member_name)
  				# "<a href='/users/#{user.id}'>@#{user.name}</a>"
          "[@#{member.name}](/members/#{member.name})"
  			else
  				m
  			end
  		end
  	end
    def send_notification
      body.scan /@\w+/ do |m|
        member_name = m[1..-1]
        if member = Member.find_by(name: member_name)
          member.notifications.create(topic_id: id, sender_id: self.member.id, unread: true)
        end
      end
    end
    def update_last_modified
      self.last_modified = Time.now.utc
    end
end

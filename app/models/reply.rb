class Reply < ActiveRecord::Base
	before_save :wrap_link_to_names
	after_save :send_notification, :update_topic_last_modified
	validates :body, presence: true
	belongs_to :member
	belongs_to :topic

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
          member.notifications.create(topic_id: topic.id, sender_id: self.member.id, reply_id: id, unread: true)
        end
      end
    end
    def update_topic_last_modified
      topic.update_attribute(:last_modified, created_at)
    end
end

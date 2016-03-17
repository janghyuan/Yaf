class Notification < ActiveRecord::Base
	belongs_to :member
	belongs_to :topic
	belongs_to :reply

	default_scope -> { order(created_at: :desc) }

	def sender
		Member.find_by(id: sender_id)
	end
end

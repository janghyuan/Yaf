class RepliesController < ApplicationController
	before_action :authenticate_member!, only: [:create]
	def index
		@topic = Topic.find_by(id: params[:id])
		@replies = @topic.replies
		@reply = current_member.replies.build if member_signed_in?
		click_count = @topic.click.to_i + 1
		@topic.update(click: click_count)
	end

	def create
		@topic = Topic.find_by(id: params[:topic_id])
		@replies = @topic.replies
		@reply = current_member.replies.build(reply_params)
		if @reply.save
			redirect_to single_topic_url(@topic)
		else
			render 'replies/index'
		end
	end

	private
		def reply_params
			params.require(:reply).permit(:body, :topic_id, :floor)
		end
end

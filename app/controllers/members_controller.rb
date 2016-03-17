class MembersController < ApplicationController
	def show
		@member = Member.find_by(name: params[:name])
		@replies = @member.replies.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
	end

end

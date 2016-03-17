class NotificationsController < ApplicationController
	before_action :authenticate_member!, only: [:index]
  def index
  	@notifications = current_member.notifications.paginate(page: params[:page], per_page: 10)
  	@notifications.each do |noti|
  		noti.update_attribute(:unread, false)
  	end
  end
end

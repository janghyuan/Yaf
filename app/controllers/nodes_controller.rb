class NodesController < ApplicationController
	before_action :authenticate_member!, only: [:new, :create]
  before_action :is_admin_member?, only: [:new, :create]
  def new
  	@node = Node.new
  end

  def create
  	@node = Node.new(node_params)
  	if @node.save
  		redirect_to new_node_url
  	else
  		render 'new'
  	end
  end

  def show
    @node = Node.find_by(slogan: params[:slogan])
    @topics = @node.topics.paginate(page: params[:page], per_page: 10)
  end

  private
  	def node_params
  		params.require(:node).permit(:slogan, :name, :parent_slogan)
  	end
end

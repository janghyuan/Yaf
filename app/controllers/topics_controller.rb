class TopicsController < ApplicationController
	before_action :authenticate_member!, only: [:new, :create, :add]
	def index
		@topics = Topic.paginate(page: params[:page], per_page: 15)
	end
	def new
		@topic = current_member.topics.build
		@nodes = Node.all
	end
	def create
		@topic = current_member.topics.build(topic_params)
		@nodes = Node.all
		if @topic.save
			redirect_to root_url
		else
			render 'new'
		end
	end
	def show
		@topic = Topic.find_by(id: params[:id])
		click_count = @topic.click.to_i + 1
		@topic.update(click: click_count)
	end
	def add
		id = params[:id].to_i
		old_ids = current_member.collection.to_s.split(",").map(&:to_i)
		same = false
		old_ids.each do |i|
			if i == id
				same = true
			end
		end
		if !same
			topic_id = "#{params[:id]},"
			old_collection = current_member.collection.to_s
			current_member.update_attribute(:collection, old_collection << topic_id)
			redirect_to :back
		else
			redirect_to :back
		end
	end
	def my_topics 
		member = Member.find_by(name: params[:name])
		@topics = Topic.where("id IN (?)", member.topic_ids).paginate(page: params[:page], per_page: 10)
	end
	def my_replies_topics
		member = Member.find_by(name: params[:name])
		topic_ids = Reply.where("id IN (?)", member.reply_ids).map do |reply|
			reply.topic_id
		end
		@topics = Topic.where("id IN (?)", topic_ids.uniq).paginate(page: params[:page], per_page: 10)
	end
	def collection
		ids = current_member.collection.to_s.split(",").map(&:to_i)
		@topics = Topic.where("id IN (?)", ids).paginate(page: params[:page], per_page: 10)
	end

	private
		def topic_params
			params.require(:topic).permit(:title, :body, :node_id)
		end
end

class Node < ActiveRecord::Base
	has_many :topics

	def Node.leagues
		Node.where(parent_slogan: "league")
	end
	def Node.jobs
		Node.where(parent_slogan: "jobs")
	end
	def Node.animes
		Node.where(parent_slogan: "anime")
	end
	def Node.techs
		Node.where(parent_slogan: "tech")
	end
	def Node.academys
		Node.where(parent_slogan: "academy")
	end
	def Node.recent_nodes
		Node.order(created_at: :desc).take(10)
	end
end

class PagesController < ApplicationController
	 # before_filter :require_admin, only: [:panel, :traffic]
	def about
	end

	def contact
	end

	def panel
		@impressions = Impression.all.order("created_at DESC")
		# @impression = Impression.where
		@requests = Request.all
    
	end

	def traffic
		@impressions = Impression.all.order("created_at DESC")
	end
end

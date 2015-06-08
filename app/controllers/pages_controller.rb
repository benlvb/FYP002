class PagesController < ApplicationController
	def about
	end

	def contact
	end

	def panel
		@impressions = Impression.all.order("created_at DESC")
	end
end

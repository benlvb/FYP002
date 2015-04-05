class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@request = Request.find(params[:request_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.request_id = @request.id

		if @comment.save
			redirect_to request_path(@request)
		else
			render 'new'
		end
	end
end

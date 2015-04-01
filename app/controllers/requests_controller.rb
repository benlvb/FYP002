class RequestsController < ApplicationController

before_action :find_request, only: [:show, :edit, :update, :destroy]

	def index
		@requests = Request.all.order("created_at DESC")
	end

	def show
	end

	def new
		@request = Request.new
	end

	def create
		@request = Request.new(requests_params)
		if @request.save
			redirect_to @request
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @request.update(requests_params)
			redirect_to @request
		else
			render 'edit'
		end
	end

	def destroy
		@request.destroy
		redirect_to root_path
	end

	private

	def requests_params
		params.require(:request).permit(:title, :matric_no, :phone_no, :rate, :description)
	end

	def find_request
		@request = Request.find(params[:id])
	end
end

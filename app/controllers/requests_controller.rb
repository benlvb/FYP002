class RequestsController < ApplicationController
before_action :find_request, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:category].blank?
			@requests = Request.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@requests = Request.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		@category = Category.find(Request.find(params[:id]).category_id)
	end

	def new
		@request = current_user.requests.build
	end

	def create
		@request = current_user.requests.build(requests_params)
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
		params.require(:request).permit(:title, :matric_no, :phone_no, :rate, :description, :category_id)
	end

	def find_request
		@request = Request.find(params[:id])
	end
end

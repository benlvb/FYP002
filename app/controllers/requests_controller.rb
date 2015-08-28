class RequestsController < ApplicationController
before_action :find_request, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
before_action :authenticate_user!, except: [:index, :show]
skip_before_filter :verify_authenticity_token
before_filter :set_twitter, only: [:create]
impressionist 
# :actions=>[:show,:index]

	def index
		if params[:category].blank?
			@requests = Request.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@requests = Request.where(category_id: @category_id).order("created_at DESC")
			@images = Request.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		@category = Category.find(Request.find(params[:id]).category_id)
		@comments = Comment.where(request_id: @request)
		@images = @request.images
		@highestlike_request = Request.all.order("likes DESC").first 
		@request = Request.find(params[:id])
		impressionist(@request)
	end


	def set_twitter
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["TWITTERCONSUMERKEY"]
		  config.consumer_secret     = ENV["TWITTERCONSUMERSECRET"]
		  config.access_token        = ENV["TWITTERACCESSTOKEN"]
		  config.access_token_secret = ENV["TWITTERACCESSTOKENSECRET"]
		end
	end

	def new
		@request = current_user.requests.build
	end

	def create
		@request = Request.new(requests_params)
		@request.user = current_user
		if @request.save
			url = request_url(@request)
			message = "#{@request.title} - "+"#{@request.description} - "+"##{@request.keyword} - "+"#shopurous - "+url
			@send_tweet = @client.update(message) unless message == nil
			redirect_to @request, flash: { success: 'Request has been created!' }
		else
			render 'new'
		end
	end

	def edit
		@images = @request.images

	end

	def update
		if @request.update(requests_params)
			redirect_to @request, flash: { success: 'Request has been updated!' }
		else
			render 'edit'
		end
	end

	def destroy
		@request.destroy
		redirect_to root_path
	end

	def upvote
		@request.upvote_by current_user
		@request.likes +=1
		@request.save
		redirect_to :back
	end

	def downvote
		@request.downvote_by current_user
		redirect_to :back
	end

	private

	def requests_params
		params.require(:request).permit(:title, :matric_no, :phone_no, :rate, :description, :address, :keyword, :likes, :longitude, :latitude, :category_id, images_attributes:[:id, :content, :_destroy])
	end

	def find_request
		@request = Request.find(params[:id])
	end
end

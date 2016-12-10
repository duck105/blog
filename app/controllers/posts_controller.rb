class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.page(params[:page]).per(5)
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to post_path(@post)
			flash[:notice] = "post was successfully created"
		else 
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = current_user.posts.find(params[:id])

		if @post.update(post_params)
			redirect_to post_path(@post)
			flash[:notice] = "post was successfully updated"
		else 
			render 'edit'
		end
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy

		redirect_to root_path
		flash[:alert] = "post was successfully destroyed"
	end

	def who
		
	end


	private
		def post_params
			params.require(:post).permit(:title, :body, :user_id)
		end
end

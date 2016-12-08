class PostsController < ApplicationController
	def index
		@posts = Post.page(params[:page]).per(5)

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save

		redirect_to post_path(@post)
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to post_path(@post)
		else 
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end

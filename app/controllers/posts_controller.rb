class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  #original code, using form_tag:
	#   @post.update(title: params[:title], description: params[:description])
	# New code that adds the .require so that form_for knows what data to pull:
	@post.update(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end
end
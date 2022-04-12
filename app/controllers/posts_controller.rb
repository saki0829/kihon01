class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post_path(post), notice: 'Post was successfully created.'
  end

  def destroy
      @post = Post.all
      @post = Post.find(params[:id])
      if @post.user_id != @current_user.id
        redirect_to posts_path
      else
        @post.destroy
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
      end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user)
  end
end

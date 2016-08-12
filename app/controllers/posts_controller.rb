class PostsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.page(params[:page]) }

  def show
    @sub_exists = current_user.subscriptions.where(blog_id: post.blog_id).exists?
  end

  def index
    @subscriptions = current_user.subscriptions
  end

  def create
    blog = Blog.find_by user_id: current_user.id

    if blog.nil?
      blog = Blog.new(user_id: current_user.id)
      blog.save
    end

    post.blog_id = blog.id
    post.user_id = current_user.id
    post.save

    respond_with post
  end

  def update
    post.save

    respond_with post
  end

  def destroy
    post.destroy

    respond_with post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

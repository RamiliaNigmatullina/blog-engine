class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.page(params[:page]) }

  def show
    @sub_exists = current_user.subscriptions.where(blog_id: post.user_id).exists?
  end

  def index
    @subscription = current_user.subscriptions.find_by(blog_id: params[:blog_id])
    @all_blogs = Post.select(:user_id).map(&:user_id).uniq # add counter cache
  end

  def create
    post.user = current_user
    post.save

    respond_with post
  end

  def update
    post.save

    respond_with post
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
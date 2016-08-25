class PostsController < ApplicationController
  respond_to :html

  expose_decorated(:post, attributes: :post_params)

  expose_decorated(:comments) { post_comments }
  expose_decorated(:subscriptions) { current_user_subscriptions }

  def show
  end

  def index
    return unless params[:search]
    @s_posts = Post.search(params[:search])
  end

  private

  def post_comments
    post.comments.includes(:user)
  end

  def current_user_subscriptions
    current_user.subscriptions.includes(:blog)
  end
end

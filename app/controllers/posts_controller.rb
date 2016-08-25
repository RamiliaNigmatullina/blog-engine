class PostsController < ApplicationController
  respond_to :html

  expose_decorated(:post, attributes: :post_params)
  expose_decorated(:posts) { paginated_posts }

  expose_decorated(:comments) { post_comments }
  expose_decorated(:subscriptions) { current_user_subscriptions }

  def show
    return unless current_user.present?
    @subscription = Subscription.find_by blog_id: post.blog.id, user_id: current_user.id
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

  def paginated_posts
    Post.includes(:blog).page(params[:page]).per(5)
  end
end

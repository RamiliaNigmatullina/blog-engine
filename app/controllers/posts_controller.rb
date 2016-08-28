class PostsController < ApplicationController
  respond_to :html

  expose_decorated(:post, attributes: :post_params)
  expose_decorated(:posts) { fetch_posts }

  expose_decorated(:comments) { post_comments }
  expose_decorated(:subscriptions) { current_user_subscriptions }

  def show
  end

  def index
  end

  private

  def post_comments
    post.comments.includes(:user)
  end

  def current_user_subscriptions
    current_user.subscriptions.includes(:blog)
  end

  def fetch_posts
    if params[:search]
      Post.includes(:blog).joins(:tags).where(tags: { name: params[:search] })
    else
      Post.includes(:blog).page(params[:page]).per(5)
    end
  end
end

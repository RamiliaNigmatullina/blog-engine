class PostsController < ApplicationController
  expose_decorated(:post) { fetch_post }
  expose_decorated(:posts) { fetch_posts }
  expose_decorated(:comments) { post_comments }

  expose(:subscriptions) { current_user_subscriptions }
  expose(:like) { fetch_like }

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

  def fetch_post
    Post.includes(:blog).find_by id: params[:id]
  end

  def fetch_posts
    Post.includes(:blog).tagged_with(params[:q]).page(params[:page]).per(10)
  end

  def fetch_like
    current_user.likes.find_by post: post if current_user
  end
end

class PostsController < ApplicationController
  respond_to :html

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
    if params[:q]
      Post.includes(:blog).tagged_with(params[:q]).page(params[:page]).per(10)
    elsif params[:blog]
      Post.includes(:blog).joins(:blog)
          .where(blogs: { id: params[:blog] }).order(created_at: :desc).page(params[:page]).per(10)
    else
      Post.includes(:blog).joins(blog: :subscriptions)
          .where(subscriptions: { user: current_user }).order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def fetch_like
    current_user.likes.where(post: post).first if current_user
  end
end

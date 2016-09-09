class MyFeedsController < ApplicationController
  respond_to :html

  expose_decorated(:posts) { fetch_posts }

  def index
  end

  private

  def fetch_posts
    if params[:blog_id]
      Post.includes(:blog).joins(:blog).where(blogs: { id: params[:blog_id] })
          .order(created_at: :desc).page(params[:page]).per(10)
    else
      Post.includes(:blog).joins(blog: :subscriptions).where(subscriptions: { user_id: current_user.id })
          .order(created_at: :desc).page(params[:page]).per(10)
    end
  end
end

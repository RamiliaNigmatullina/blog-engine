class BlogsController < ApplicationController
  expose_decorated :blog
  expose_decorated :blogs

  expose_decorated(:posts) { blog_posts }
  expose(:subscription) { fetch_subscription }
  expose(:categories) { Category.includes(:blogs) }

  def index
  end

  def show
  end

  private

  def blog_posts
    blog.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def fetch_subscription
    current_user.subscriptions.where(blog: blog).first if current_user
  end
end

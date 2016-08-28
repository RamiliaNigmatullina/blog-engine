class PostsController < ApplicationController
  respond_to :html

  expose_decorated(:post) { fetch_post }
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
    if params[:q]
      Post.includes(:blog).joins(:tags).where(tags: { name: params[:q] })
    else
      Post.includes(:blog).joins(blog: :subscriptions).where(subscriptions: { user_id: current_user.id })
          .order(created_at: :desc)
    end
  end

  def fetch_post
    Post.includes(:blog).find_by id: params[:id]
  end
end

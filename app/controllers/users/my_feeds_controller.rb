module Users
  class MyFeedsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated(:posts) { fetch_posts }

    def index
    end

    private

    def fetch_posts
      posts = Post.where(blog: params[:blog] || current_user.subscribed_blogs.pluck(:blog_id)).order(created_at: :desc)
      posts.includes(:blog).page(params[:page]).per(10)
    end
  end
end

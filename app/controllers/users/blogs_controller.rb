module Users
  class BlogsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated :blog, attributes: :blog_params

    def new
    end

    def create
      blog.user = current_user
      blog.save

      respond_with blog
    end

    def edit
    end

    def update
      blog.save

      respond_with blog
    end

    def destroy
      blog.subscriptions.each(&:destroy)
      blog.posts.each(&:destroy)
      blog.destroy

      respond_with blog
    end

    private

    def blog_params
      params.require(:blog).permit(:name, :description, :category_id)
    end
  end
end

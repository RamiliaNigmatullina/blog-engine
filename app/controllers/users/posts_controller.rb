module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated(:post, attributes: :post_params)

    def new
      redirect_to new_users_blog_path if current_user.blogs.empty?
    end

    def create
      post.user = current_user
      post.save

      # UserMailer.new_post(post).deliver_later

      respond_with post
    end

    def update
      post.save

      respond_with post
    end

    def destroy
      post.tags.each(&:destroy)
      post.destroy

      respond_with post
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :blog_id, :tag_list)
    end
  end
end

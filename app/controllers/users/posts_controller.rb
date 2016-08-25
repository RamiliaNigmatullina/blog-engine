module Users
  class PostsController < ApplicationController
    before_action :authenticate_user!

    expose_decorated(:post, attributes: :post_params)

    def new
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
      params.require(:post).permit(:title, :body, :blog_id, tags_attributes: %i(id post_id name _destroy))
    end
  end
end

module Users
  class LikesController < ApplicationController
    respond_to :html

    expose(:like)
    expose(:post)

    def create
      like.user = current_user
      like.post = post

      like.save

      respond_with like, location: post_path(post)
    end

    def destroy
      like.destroy

      respond_with like, location: post_path(post)
    end
  end
end

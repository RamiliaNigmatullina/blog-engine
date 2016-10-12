class LikesController < ApplicationController
  expose(:like)
  expose(:post)

  def create
    like.user = current_user
    like.post = post

    like.save
    redirect_to post
  end

  def destroy
    like.destroy
    redirect_to like.post
  end
end

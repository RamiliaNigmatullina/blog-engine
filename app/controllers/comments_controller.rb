class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose :post

  expose_decorated :comment, attributes: :comment_params, from: :post

  def index
  end

  def create
    comment.user = current_user
    comment.post_id = post.id
    comment.save

    redirect_to post
  end

  def destroy
    comment.destroy

    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

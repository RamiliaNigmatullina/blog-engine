class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose :post
  expose :comment, attributes: :comment_params, from: :post

  respond_to :html

  def create
    comment.user = current_user
    comment.post_id = post.id
    comment.save

    respond_with post
  end

  def destroy
    comment.destroy
    respond_with post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

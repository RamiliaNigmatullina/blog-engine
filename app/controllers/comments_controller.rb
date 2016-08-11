class CommentsController < ApplicationController
  before_action :authenticate_user!

  expose :post, finder_parameter: :post_id
  expose :comment, ancestor: :post

  respond_to :html

  def create
    comment.user = current_user
    comment.save

    respond_with post
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

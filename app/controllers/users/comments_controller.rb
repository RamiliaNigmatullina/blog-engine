module Users
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    expose :post
    expose_decorated :comment, attributes: :comment_params, from: :post

    def create
      comment.user = current_user
      comment.post_id = post.id
      comment.save

      UserMailer.new_comment(comment).deliver_later

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
end

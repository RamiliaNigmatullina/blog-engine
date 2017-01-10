module Users
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    expose :post
    expose_decorated :comment, attributes: :comment_params

    def create
      comment.update(user: current_user, post: post)

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

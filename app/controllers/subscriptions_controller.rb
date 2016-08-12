class SubscriptionsController < ApplicationController
  expose :post
  expose :subscription

  def create
    subscription.user = current_user
    subscription.blog_id = post.blog_id

    subscription.save
    respond_with post
  end

  def destroy
    subscription.destroy

    respond_with post
  end
end

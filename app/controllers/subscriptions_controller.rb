class SubscriptionsController < ApplicationController
  expose_decorated :blog
  expose_decorated :subscription

  def create
    subscription.user = current_user
    subscription.blog_id = blog.id

    subscription.save
    redirect_to blog
  end

  def destroy
    subscription.destroy

    redirect_to subscription.blog
  end
end

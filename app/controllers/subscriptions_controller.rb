class SubscriptionsController < ApplicationController
  expose :blog
  expose :subscription

  def create
    subscription.update(user: current_user, blog: blog)

    redirect_to blog
  end

  def destroy
    subscription.destroy

    redirect_to subscription.blog
  end
end

class SubscriptionsController < ApplicationController
  expose :blog
  expose :subscription

  def create
    subscription.user = current_user
    subscription.blog = blog

    subscription.save
    redirect_to blog
  end

  def destroy
    subscription.destroy

    redirect_to subscription.blog
  end
end

class SubscriptionsController < ApplicationController

  expose :subscription, attributes: subscription_params

  def create
    subscription.user = current_user

    subscription.save
    redirect_to posts_path
  end

  def update
    subscription.save

    respond_with subscription
  end

  def destroy
    subscription.destroy

    redirect_to posts_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:blog_id, :user_id)
  end
end

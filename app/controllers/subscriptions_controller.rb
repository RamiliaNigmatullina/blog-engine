class SubscriptionsController < ApplicationController
  expose(:subscription)
  expose(:subscriptions) { Subscription.page(params[:page]) }

  attr_accessor :sub_exists

  def create
    subscription.user_id = current_user.id
    subscription.blog_id = params[:blog_id]
    user = User.find(params[:blog_id])
    flash[:notice] = "You subscribed to #{user.full_name}'s blog successfully." if subscription.save
    redirect_to(post_path(params[:post_id]))
  end

  def update
    flash[:notice] = "Subscription was successfully updated." if subscription.save
    respond_with(subscription)
  end

  def destroy
    subscription.destroy
    respond_with(subscription)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:blog_id, :user_id)
  end
end

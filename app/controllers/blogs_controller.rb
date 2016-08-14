class BlogsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated(:blog)
  expose_decorated(:blogs) { paginated_blogs }

  def show
    @subscription = Subscription.find_by blog_id: blog.id, user_id: current_user.id
  end

  def destroy
    blog.destroy
    respond_with blog
  end

  private

  def paginated_blogs
    Blog.includes(:user).page(params[:page])
  end
end

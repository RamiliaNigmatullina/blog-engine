class BlogsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose(:blog)
  expose(:blogs) { Blog.page(params[:page]) }

  def show
    @subscription = Subscription.find_by blog_id: blog.id, user_id: current_user.id
  end

  def destroy
    blog.destroy
    respond_with blog
  end
end

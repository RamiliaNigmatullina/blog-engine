class BlogsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated(:blog, attributes: :blog_params)
  expose_decorated(:blogs) { paginated_blogs }

  def show
    @subscription = Subscription.find_by blog_id: blog.id, user_id: current_user.id
  end

  def create
    blog.user = current_user
    blog.save

    respond_with blog
  end

  def destroy
    blog.destroy
    respond_with blog
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :theme_id)
  end

  def paginated_blogs
    Blog.includes(:user).page(params[:page])
  end
end

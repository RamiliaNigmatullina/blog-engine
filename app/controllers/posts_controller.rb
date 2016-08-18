class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated(:post, attributes: :post_params)
  expose_decorated(:posts) { Post.page(params[:page]) }

  expose_decorated(:comments) { post_comments }
  expose_decorated(:subscriptions) { current_user_subscriptions }

  def show
    @subscription = Subscription.find_by blog_id: post.blog.id, user_id: current_user.id
  end

  def create
    blog = Blog.find_by user_id: current_user.id

    if blog.nil?
      blog = Blog.new(user_id: current_user.id)
      blog.save
    end

    post.blog_id = blog.id
    post.user_id = current_user.id
    post.save

    UserMailer.new_post(post).deliver_later

    respond_with post
  end

  def update
    post.save

    respond_with post
  end

  def destroy
    post.destroy

    respond_with post
  end

  private

  def post_comments
    post.comments.includes(:user)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def current_user_subscriptions
    current_user.subscriptions.includes(blog: [:user])
  end
end

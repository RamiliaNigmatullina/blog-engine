class ProfilesController < ApplicationController
  expose_decorated(:user)
  expose_decorated(:blog) { new_blog }

  private

  def new_blog
    Blog.new
  end
end

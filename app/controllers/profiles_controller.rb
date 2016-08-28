class ProfilesController < ApplicationController
  expose_decorated(:user)
  expose(:blog) { Blog.new }
end

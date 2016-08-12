class BlogsController < ApplicationController
  respond_to :html

  expose(:blog, attributes: :blog_params)
  expose(:blogs) { Blog.page(params[:page]) }

  def create
    flash[:notice] = 'Blog was successfully created.' if blog.save
    respond_with(blog)
  end

  def update
    flash[:notice] = 'Blog was successfully updated.' if blog.save
    respond_with(blog)
  end

  def destroy
    blog.destroy
    respond_with(blog)
  end

  private

  def blog_params
    params.require(:blog).permit()
  end
end

class DeleteBlogIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :blog_id
  end
end

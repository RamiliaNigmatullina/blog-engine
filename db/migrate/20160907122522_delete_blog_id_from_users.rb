class DeleteBlogIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :blog_id
  end
end

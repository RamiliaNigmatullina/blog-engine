class DeleteBlogIdFromSubsctions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :blog_id
  end
end

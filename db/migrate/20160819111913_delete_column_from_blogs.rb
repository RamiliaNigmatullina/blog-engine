class DeleteColumnFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :theme_id
  end
end

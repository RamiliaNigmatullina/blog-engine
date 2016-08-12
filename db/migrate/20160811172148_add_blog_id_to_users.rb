class AddBlogIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :blog, index: true, foreign_key: true
  end
end

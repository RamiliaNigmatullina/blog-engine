class AddBlogIdToSubscriptions < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :blog, index: true, foreign_key: true
  end
end

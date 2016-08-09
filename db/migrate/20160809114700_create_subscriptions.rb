class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :blog_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
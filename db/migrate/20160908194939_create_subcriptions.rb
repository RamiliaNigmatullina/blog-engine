class CreateSubcriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :blog, index: true, foreign_key: true
    end
  end
end

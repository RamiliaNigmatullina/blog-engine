class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :blog, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

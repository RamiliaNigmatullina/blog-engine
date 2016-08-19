class AddThemeIdToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :theme, index: true, foreign_key: true
  end
end

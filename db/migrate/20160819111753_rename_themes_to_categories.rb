class RenameThemesToCategories < ActiveRecord::Migration
  def change
    rename_table :themes, :categories
  end
end

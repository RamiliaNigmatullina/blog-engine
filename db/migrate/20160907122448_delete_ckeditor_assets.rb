class DeleteAvatarFromUsers < ActiveRecord::Migration
  def change
    drop_table :ckeditor_assets
  end
end

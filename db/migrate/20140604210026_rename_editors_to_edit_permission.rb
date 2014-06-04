class RenameEditorsToEditPermission < ActiveRecord::Migration
  def change
    rename_table :editors, :edit_permissions
  end
end

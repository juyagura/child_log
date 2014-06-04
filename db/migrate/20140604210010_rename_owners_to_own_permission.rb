class RenameOwnersToOwnPermission < ActiveRecord::Migration
  def change
    rename_table :owners, :own_permissions
  end
end

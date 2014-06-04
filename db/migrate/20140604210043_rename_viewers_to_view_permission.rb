class RenameViewersToViewPermission < ActiveRecord::Migration
  def change
    rename_table :viewers, :view_permissions
  end
end

class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :child_id
      t.integer :user_id

      t.timestamps

    end
  end
end

class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|
      t.text :description
      t.date :date
      t.time :time
      t.integer :child_id
      t.integer :user_id

      t.timestamps

    end
  end
end

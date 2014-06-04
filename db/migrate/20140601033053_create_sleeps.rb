class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.string :category
      t.date :date
      t.time :time
      t.float :duration_hours
      t.integer :child_id
      t.integer :user_id

      t.timestamps

    end
  end
end

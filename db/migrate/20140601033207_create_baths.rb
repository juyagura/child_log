class CreateBaths < ActiveRecord::Migration
  def change
    create_table :baths do |t|
      t.date :date
      t.time :time
      t.integer :child_id
      t.integer :user_id

      t.timestamps

    end
  end
end

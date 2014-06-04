class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.date :date
      t.integer :child_id
      t.integer :user_id

      t.timestamps

    end
  end
end

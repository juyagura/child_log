class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.date :dob
      t.string :sex

      t.timestamps

    end
  end
end

class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.date :date
      t.text :caption
      t.integer :user_id
      t.integer :child_id

      t.timestamps

    end
  end
end

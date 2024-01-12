class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :spot_name, null: false
      t.integer :user_id, null: false
      t.text :caption
      t.string :address, null: false

      t.timestamps
    end
  end
end

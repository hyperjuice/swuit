class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :price
      t.datetime :availability
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

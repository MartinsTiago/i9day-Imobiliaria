class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :trasaction_type
      t.string :goal
      t.string :kind
      t.integer :number_rooms
      t.integer :number_bathrooms
      t.integer :number_parking_places
      t.integer :area
      t.boolean :has_elevator
      t.integer :age
      t.float :latitute
      t.float :logitude
      t.integer :sell_value
      t.integer :rent_value

      t.timestamps
    end
  end
end

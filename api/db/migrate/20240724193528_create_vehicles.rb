class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :type
      t.integer :make_id
      t.integer :model_id
      t.string :year
      t.string :vin
      t.integer :miles
      t.string :color
      t.integer :customer_id

      t.timestamps
    end
    add_index :vehicles, :name
    add_index :vehicles, :type
    add_index :vehicles, :make_id
    add_index :vehicles, :model_id
    add_index :vehicles, :year
    add_index :vehicles, :vin, unique: true
    add_index :vehicles, :customer_id
  end
end

class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :type
      t.integer :interval_miles
      t.integer :interval_days

      t.timestamps
    end
    add_index :services, :name
    add_index :services, :type
  end
end

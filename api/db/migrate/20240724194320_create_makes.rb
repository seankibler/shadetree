class CreateMakes < ActiveRecord::Migration[7.1]
  def change
    create_table :makes do |t|
      t.string :name

      t.timestamps
    end
    add_index :makes, :name
  end
end

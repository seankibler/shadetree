class CreateModels < ActiveRecord::Migration[7.1]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :make_id

      t.timestamps
    end
    add_index :models, :name
    add_index :models, :make_id
  end
end

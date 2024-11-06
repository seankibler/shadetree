class CreateSubModels < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_models do |t|
      t.string :name
      t.integer :model_id

      t.timestamps
    end
    add_index :sub_models, :name
    add_index :sub_models, :model_id
  end
end

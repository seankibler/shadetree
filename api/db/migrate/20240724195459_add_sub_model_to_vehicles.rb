class AddSubModelToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :sub_model_id, :integer
    add_index :vehicles, :sub_model_id
  end
end

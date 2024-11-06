class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
    add_index :customers, :city
    add_index :customers, :state
  end
end

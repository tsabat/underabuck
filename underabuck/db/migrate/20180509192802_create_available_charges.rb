class CreateAvailableCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :available_charges do |t|
      t.integer :product_id
      t.integer :vendor_id
      t.integer :charge_id
      t.string :charge_type
      t.string :charge_name

      t.timestamps
    end
  end
end

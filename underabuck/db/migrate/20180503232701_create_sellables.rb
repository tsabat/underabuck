class CreateSellables < ActiveRecord::Migration[5.2]
  def change
    create_table :sellables do |t|
      t.integer :vendor_id
      t.string :product_id
      t.string :part_id
      t.integer :import_id

      t.timestamps
    end
  end
end

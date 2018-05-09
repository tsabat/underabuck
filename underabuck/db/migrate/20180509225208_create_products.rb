class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :product_name
      t.text :description
      t.text :product_marketing
      t.string :product_brand
      t.string :export
      t.string :product_category
      t.string :product_sub_category
      t.string :part_id
      t.string :color
      t.text :primary_material
      t.text :dimension
      t.integer :is_rush_service
      t.text :shipping
      t.boolean :is_closeout
      t.boolean :is_on_demand
      t.boolean :is_hasmat
      t.datetime :last_change_date
      t.datetime :creation_date
      t.string :line_name

      t.timestamps
    end
  end
end

class CreateFobPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :fob_points do |t|
      t.integer :vendor_id
      t.integer :product_id
      t.string :fob_id
      t.string :fob_city
      t.string :fob_state
      t.string :fob_postal_code
      t.string :fob_country
      t.string :currency_supported

      t.timestamps
    end
  end
end

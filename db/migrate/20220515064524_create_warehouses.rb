class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :street_address
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end

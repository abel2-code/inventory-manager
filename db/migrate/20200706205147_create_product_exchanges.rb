class CreateProductExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :product_exchanges do |t|
      t.references :musician, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :exchange_type
      t.boolean :refundable?
      t.integer :total_number_scheduled

      t.timestamps
    end
  end
end

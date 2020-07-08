class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :brand
      t.integer :serial
      t.integer :purchase_cost
      t.boolean :available?
      t.boolean :rentable?
      t.integer :rate_for_rental
      t.integer :gc_branch_id

      t.timestamps
    end
  end
end

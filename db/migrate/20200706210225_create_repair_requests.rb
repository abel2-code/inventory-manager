class CreateRepairRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_requests do |t|
      t.references :product, null: false, foreign_key: true
      t.references :repair_shop, null: false, foreign_key: true
      t.integer :cost
      t.datetime :date_of_return

      t.timestamps
    end
  end
end

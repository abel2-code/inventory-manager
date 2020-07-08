class CreateRepairShops < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_shops do |t|
      t.string :name
      t.string :city
      t.integer :capacity

      t.timestamps
    end
  end
end

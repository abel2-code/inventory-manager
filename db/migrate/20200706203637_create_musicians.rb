class CreateMusicians < ActiveRecord::Migration[6.0]
  def change
    create_table :musicians do |t|
      t.string :name
      t.integer :bank_account
      t.boolean :is_a_student?

      t.timestamps
    end
  end
end

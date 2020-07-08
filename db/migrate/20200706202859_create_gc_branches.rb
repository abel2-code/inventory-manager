class CreateGcBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :gc_branches do |t|
      t.string :city
      t.integer :company_bank_acct

      t.timestamps
    end
  end
end

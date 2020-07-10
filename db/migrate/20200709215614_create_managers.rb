class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|
      t.string :username
      t.string :password_digest
      t.references :gc_branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end

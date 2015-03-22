class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :parent_id
      t.integer :kid_id

      t.timestamps null: false
    end
    add_index :families, :parent_id
    add_index :families, :kid_id
    add_index :families, [:parent_id, :kid_id], unique: true
  end
end

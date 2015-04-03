class CreatePubTranslationships < ActiveRecord::Migration
  def change
    create_table :pub_translationships do |t|
      t.integer :translation_id
      t.integer :original_id

      t.timestamps null: false
    end
    add_index :pub_translationships, :translation_id
    add_index :pub_translationships, :original_id
    add_index :pub_translationships, [:translation_id, :original_id], unique: true
  end
end

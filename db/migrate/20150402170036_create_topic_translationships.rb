class CreateTopicTranslationships < ActiveRecord::Migration
  def change
    create_table :topic_translationships do |t|
      t.integer :translation_id
      t.integer :original_id

      t.timestamps null: false
    end
    add_index :topic_translationships, :translation_id
    add_index :topic_translationships, :original_id
    add_index :topic_translationships, [:translation_id, :original_id], unique: true
  end
end

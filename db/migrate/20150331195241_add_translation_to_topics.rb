class AddTranslationToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :translation, :boolean, default: false
    add_index :topics, :translation
  end
end

class AddLanguageIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :language_id, :integer
    add_index :topics, :language_id
  end
end

class RemoveLanguageFromTopics < ActiveRecord::Migration
  def change

    remove_column :topics, :language_id, :integer
  end
end

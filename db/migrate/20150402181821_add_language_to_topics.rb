class AddLanguageToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :language, :integer
  end
end

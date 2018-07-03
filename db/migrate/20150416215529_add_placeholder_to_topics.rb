class AddPlaceholderToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :placeholder, :boolean, default: false
  end
end

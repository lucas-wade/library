class AddCategoryToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :category, :string, default: 0
    add_index :topics, :category
  end
end

class AddCategoryToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :category, :string
    add_index :topics, :category
  end
end

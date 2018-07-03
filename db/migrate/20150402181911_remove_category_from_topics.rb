class RemoveCategoryFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :category, :string
  end
end

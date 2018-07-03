class AddGrowingToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :growing, :boolean, default: false
  end
end

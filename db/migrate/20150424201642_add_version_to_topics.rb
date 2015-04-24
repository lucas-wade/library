class AddVersionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :version, :integer, default: 0
  end
end

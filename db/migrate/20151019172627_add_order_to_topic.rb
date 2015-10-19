class AddOrderToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :order, :integer, default: 0
  end
end

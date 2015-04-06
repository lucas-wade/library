class AddIndexToPubs < ActiveRecord::Migration
  def change
    add_index :pubs, :meta_data
  end
end

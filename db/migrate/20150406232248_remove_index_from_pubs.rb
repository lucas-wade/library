class RemoveIndexFromPubs < ActiveRecord::Migration
  def change
    remove_index :pubs, :meta_data
  end
end

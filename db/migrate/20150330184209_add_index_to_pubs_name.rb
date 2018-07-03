class AddIndexToPubsName < ActiveRecord::Migration
  def change
    add_index :pubs, :name, unique: true
  end
end

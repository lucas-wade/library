class RemovePubTypeFromPubs < ActiveRecord::Migration
  def change
    remove_column :pubs, :pub_type, :string
  end
end

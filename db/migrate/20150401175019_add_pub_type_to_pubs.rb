class AddPubTypeToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :pub_type, :integer
  end
end

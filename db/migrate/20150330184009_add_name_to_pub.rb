class AddNameToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :name, :string
  end
end

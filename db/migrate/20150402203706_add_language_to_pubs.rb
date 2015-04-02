class AddLanguageToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :language, :integer
  end
end

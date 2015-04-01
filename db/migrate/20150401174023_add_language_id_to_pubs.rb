class AddLanguageIdToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :language_id, :integer
  end
end

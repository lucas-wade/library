class RemoveLanguageFromPubs < ActiveRecord::Migration
  def change
    remove_column :pubs, :language, :string
  end
end

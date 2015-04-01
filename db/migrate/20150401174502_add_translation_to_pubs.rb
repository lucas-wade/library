class AddTranslationToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :translation, :boolean
  end
end

class AddLanguageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :language, :string, default: 'en'
    add_index :users, :language
  end
end

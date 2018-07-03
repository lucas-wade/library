class AddLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :language, :integer
  end
end

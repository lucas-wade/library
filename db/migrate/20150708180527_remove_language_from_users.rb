class RemoveLanguageFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :language, :integer
  end
end

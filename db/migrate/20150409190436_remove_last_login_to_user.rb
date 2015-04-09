class RemoveLastLoginToUser < ActiveRecord::Migration
  def change
    remove_column :users, :LastLogin, :datetime
  end
end

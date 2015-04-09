class AddLastLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :LastLogin, :datetime
  end
end

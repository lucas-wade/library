class ChangeMetaDataToLongToPubs < ActiveRecord::Migration
  def change
    change_column :pubs, :meta_data, :text, :limit => 4294967295
  end
end

class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
      t.string :language
      t.boolean :translated
      t.string :type
      t.string :url
      t.string :media
      t.string :pub_type
      t.text :meta_data

      t.timestamps null: false
    end
    add_index :pubs, :language
  end
end

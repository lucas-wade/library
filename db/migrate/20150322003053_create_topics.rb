class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :language
      t.text :main_content
      t.integer :skill

      t.timestamps null: false
    end
  end
end

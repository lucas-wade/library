class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :body_html

      t.timestamps null: false
    end
  end
end

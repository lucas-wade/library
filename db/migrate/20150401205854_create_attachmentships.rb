class CreateAttachmentships < ActiveRecord::Migration
  def change
    create_table :attachmentships do |t|
      t.integer :pub_id
      t.integer :topic_id

      t.timestamps null: false
    end
    add_index :attachmentships, :pub_id
    add_index :attachmentships, :topic_id
    add_index :attachmentships, [:pub_id, :topic_id], unique: true
  end
end

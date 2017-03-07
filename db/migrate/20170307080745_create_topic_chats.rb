class CreateTopicChats < ActiveRecord::Migration
  def change
    create_table :topic_chats do |t|
      t.references :community, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.string :body
      t.string :image
      t.integer :status,             default: 1

      t.timestamps null: false
    end
  end
end

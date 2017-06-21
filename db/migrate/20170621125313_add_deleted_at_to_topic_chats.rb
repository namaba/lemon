class AddDeletedAtToTopicChats < ActiveRecord::Migration
  def change
    add_column :topic_chats, :deleted_at, :datetime
    add_index :topic_chats, :deleted_at
  end
end

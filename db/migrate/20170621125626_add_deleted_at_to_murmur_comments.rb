class AddDeletedAtToMurmurComments < ActiveRecord::Migration
  def change
    add_column :murmur_comments, :deleted_at, :datetime
    add_index :murmur_comments, :deleted_at
  end
end

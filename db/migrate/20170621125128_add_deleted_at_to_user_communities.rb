class AddDeletedAtToUserCommunities < ActiveRecord::Migration
  def change
    add_column :user_communities, :deleted_at, :datetime
    add_index :user_communities, :deleted_at
  end
end

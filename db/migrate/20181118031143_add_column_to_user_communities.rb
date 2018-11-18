class AddColumnToUserCommunities < ActiveRecord::Migration
  def change
    add_column :user_communities, :is_orner, :boolean, default: false, after: :community_id
    add_column :user_communities, :is_banned, :boolean, default: false, after: :is_orner
  end
end

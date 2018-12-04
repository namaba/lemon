class AddIsApprovedToUserCommunities < ActiveRecord::Migration
  def change
    add_column :user_communities, :is_approved, :boolean, default: false, after: :is_banned
  end
end

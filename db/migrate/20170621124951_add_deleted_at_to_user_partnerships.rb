class AddDeletedAtToUserPartnerships < ActiveRecord::Migration
  def change
    add_column :user_partnerships, :deleted_at, :datetime
    add_index :user_partnerships, :deleted_at
  end
end

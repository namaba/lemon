class AddDeletedAtToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :deleted_at, :datetime
    add_index :announcements, :deleted_at
  end
end

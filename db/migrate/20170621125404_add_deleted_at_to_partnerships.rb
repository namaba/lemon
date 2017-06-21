class AddDeletedAtToPartnerships < ActiveRecord::Migration
  def change
    add_column :partnerships, :deleted_at, :datetime
    add_index :partnerships, :deleted_at
  end
end

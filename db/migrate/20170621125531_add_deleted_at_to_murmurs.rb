class AddDeletedAtToMurmurs < ActiveRecord::Migration
  def change
    add_column :murmurs, :deleted_at, :datetime
    add_index :murmurs, :deleted_at
  end
end

class ChangeColumnToUser < ActiveRecord::Migration
  def up
    change_column :users, :admin_flg, :boolean, default: false, null: false
  end

  # 変更前の状態
  def down
    change_column :users, :admin_flg, :boolean
  end
end

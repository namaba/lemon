class ChangeColumnTouserProfile < ActiveRecord::Migration
  # 変更後の型
  def up
    change_column :user_profiles, :address, :integer
  end

  #変更前の型
  def down
    change_column :user_profiles, :address, :text
  end
end

class ChangeBirthdayDefaultofUserProfile < ActiveRecord::Migration
  def up
    change_column_default :user_profiles, :birthday, nil
  end

  def down
    change_column_default :user_profiles, :birthday, 19000101
  end
end

class ChangeDatatypeHobbyOfUserprofiles < ActiveRecord::Migration
  def up
    change_column :user_profiles, :hobby, :text
    change_column :user_profiles, :personality, :text
  end

  def down
    change_column :user_profiles, :hobby, :string
    change_column :user_profiles, :personality, :string
  end
end

class ChangeDatatypeHobbyOfUserprofiles < ActiveRecord::Migration
  def change
    change_column :user_profiles, :hobby, :text
    change_column :user_profiles, :personality, :text
  end
end

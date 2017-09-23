class AddstatusToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :tutorial_status, :integer, default: 1, after: :mail_status
  end
end

class RemoveCharmpointFromUserProfiles < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :charmpoint, :string
    remove_column :user_profiles, :sociability, :string
    remove_column :user_profiles, :want_to_marriage, :integer
    remove_column :user_profiles, :condition, :string
  end
end

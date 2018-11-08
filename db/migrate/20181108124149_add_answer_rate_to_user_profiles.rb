class AddAnswerRateToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :answer_rate, :integer, default: 0, after: :identification_image
  end
end

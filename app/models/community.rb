class Community < ActiveRecord::Base
  belongs_to :user
  has_many :user_communities, :class_name => 'UserCommunity',:foreign_key => 'user_id'
  has_many :community_members, through: :user_communities
  has_many :topics
  mount_uploader :image, ImageUploader
end

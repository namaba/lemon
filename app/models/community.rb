class Community < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user
  has_many :user_communities, :class_name => 'UserCommunity',:foreign_key => 'community_id'
  has_many :community_members, :through => :user_communities
  has_many :topics

  has_many :waiting_user_communities, -> { waiting }, :class_name => 'UserCommunity'
  has_many :waiting_members, :through => :waiting_user_communities, :source => :user
  mount_uploader :image, ImageUploader
end

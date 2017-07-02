class UserCommunity < ActiveRecord::Base
  belongs_to :user
  belongs_to :my_community, :class_name => 'Community',:foreign_key => 'community_id'
end

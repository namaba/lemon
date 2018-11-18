class UserCommunity < ActiveRecord::Base
  belongs_to :community_members, class_name: 'User',:foreign_key => 'user_id'
  belongs_to :my_community, :class_name => 'Community',:foreign_key => 'community_id'

  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'

  enum is_orner: { not_orner: false, is_orner: true }
end

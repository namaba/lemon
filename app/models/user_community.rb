class UserCommunity < ActiveRecord::Base
  belongs_to :community_members, class_name: 'User',:foreign_key => 'user_id'
  belongs_to :my_community, :class_name => 'Community',:foreign_key => 'community_id'

  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'

  enum is_orner: { not_orner: false, orner: true }
  enum is_banned: {not_ban: false, is_banned: true}
  enum is_approved: {waiting: false, approved: true}
end

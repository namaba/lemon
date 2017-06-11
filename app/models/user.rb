class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :user_profile,  class_name: 'UserProfile',  dependent: :destroy, inverse_of: :user
  has_one :status,  class_name: 'UserStatus',  dependent: :destroy, inverse_of: :user, :foreign_key => 'user_id'

  # like
  has_many :to_like_users, :class_name => "Like", :foreign_key => 'user_id' # :class_name, :foreign_keyを指定
  has_many :from_like_users, :class_name => "Like", :foreign_key => 'target_id'  # :class_name, :foreign_keyを指定
  # partnership
  has_many :partnerships, through: :user_partnerships
  has_many :target_partnerships, :class_name => "Partnership", :foreign_key => 'target_id'
  # user_partnership
  has_many :user_partnerships, dependent: :destroy
  # community
  has_many :communities
  # murmur
  has_many :murmurs
  # murmur_comment
  has_many :murmur_comments
  # user_community
  has_many :join_communities, :class_name => 'UserCommunity',:foreign_key => 'user_id'
  has_many :my_community, through: :join_communities

  has_many :topics, :class_name => 'Topic',:foreign_key => 'user_id'

  has_many :user_chats, :class_name => 'TopicChat', :foreign_key => 'user_id'


  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :not_me, -> (user){ where.not(id: user) }
  scope :like_me, -> (user){ where(id: Like.select('user_id').where(target_id: user, status: 0))}
  scope :match, -> (user){ where(id: Like.select('user_id').where(target_id: user, status: 1))}


  def self.matching

  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large"

      # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end

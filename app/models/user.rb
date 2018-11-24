class User < ActiveRecord::Base

  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :user_profile,  class_name: 'UserProfile',  dependent: :destroy, inverse_of: :user
  has_one :status,  class_name: 'UserStatus',  dependent: :destroy, inverse_of: :user, :foreign_key => 'user_id'

  # like
  has_many :to_likes, :class_name => "Like", :foreign_key => 'user_id' # :class_name, :foreign_keyを指定
  has_many :from_likes, :class_name => "Like", :foreign_key => 'target_id'  # :class_name, :foreign_keyを指定
  # partnership
  has_many :partnerships, through: :user_partnerships
  has_many :target_partnerships, :class_name => "Partnership", :foreign_key => 'target_id'
  # user_partnership
  has_many :user_partnerships, dependent: :destroy
  # community
  has_many :communities
  # murmur
  has_many :murmurs, dependent: :destroy
  # murmur_comment
  has_many :murmur_comments, dependent: :destroy
  # user_community
  has_many :join_communities, :class_name => 'UserCommunity',:foreign_key => 'user_id'
  has_many :my_community, through: :join_communities, dependent: :destroy

  has_many :topics, :class_name => 'Topic',:foreign_key => 'user_id'

  has_many :topic_chats, :class_name => 'TopicChat', :foreign_key => 'user_id', dependent: :destroy

  has_many :murmur_smiles
  has_many :topic_smiles

  delegate :pay_coin, :free_coin,:good_count, to: :status
  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :not_me, -> (user){ where.not(id: user) }
  scope :like_me, -> (user){ where(id: Like.select('user_id').where(target_id: user, status: 0))}
  scope :match, -> (user){ where(id: Like.select('user_id').where(target_id: user, status: 1))}


  def hoge
    puts "hoge"
  end

  # TODO: リファクタ
  def reduce_good
    if self.status.good_count > 0
      self.status.good_count -= 1
      self.status.save
    elsif self.status.free_coin > 0
      self.status.free_coin -= 1
      self.status.save
    elsif self.status.pay_coin > 0
      self.status.pay_coin -= 1
      self.status.save
    else
      false
      @message = 'コインが不足しています。'
    end
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

  def is_partner_of?(user)
    partner_ids = partnerships.pluck(:user_id, :target_id).map{ |u_id, t_id|
     u_id == self.id ? t_id : u_id
    }
    partner_ids.include?(user.id)
  end

  def like?(user)
    to_likes.pluck(:target_id).include?(user.id)
  end

  def is_liked_from?(user)
    from_likes.pluck(:user_id).include?(user.id)
  end

  def is_banned?(community)
    join_communities.find_by(community_id: community.id).is_banned?
  end
end

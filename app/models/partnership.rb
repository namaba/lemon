class Partnership < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user
  belongs_to :target, :class_name => "User"

  has_many :partner_couples, class_name: 'UserPartnership', foreign_key: :partnership_id, dependent: :destroy
  has_many :couples, through: :partner_couples


  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :not_me, -> (user){ where.not(id: user) }
  scope :like_me, -> (user){ where(id: Like.select('user_id').where(target_id: user, status: 0))}


  validates_uniqueness_of :user_id, scope: [:target_id]

  #----------------------------------------
  #  ** InstanceMethod **
  #----------------------------------------
  def partner(me)
    couples.each { |user| return user unless user == me }
  end
end

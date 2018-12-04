class Report < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :target, :class_name => "User"

  validates_uniqueness_of :user_id, scope: [:target_id]

  #----------------------------------------
  #  ** Scope **
  #----------------------------------------
  scope :done_report, -> (user){ where(id: Report.select('user_id').where(user_id: user))}


end

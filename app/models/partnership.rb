class Partnership < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, :class_name => "User"

  has_many :user_partnerships
end

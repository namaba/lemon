class UserPartnership < ActiveRecord::Base
  belongs_to :couple, class_name: 'User', foreign_key: :user_id
  belongs_to :partnership
end

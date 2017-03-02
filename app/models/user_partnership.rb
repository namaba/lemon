class UserPartnership < ActiveRecord::Base
  belongs_to :user
  belongs_to :partnership
end

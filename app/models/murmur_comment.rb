class MurmurComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :murmur
end

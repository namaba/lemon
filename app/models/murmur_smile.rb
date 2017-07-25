class MurmurSmile < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user
  belongs_to :murmur
end

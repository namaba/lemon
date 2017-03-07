class Community < ActiveRecord::Base
  belongs_to :user

  has_many :topics
  mount_uploader :image, ImageUploader
end

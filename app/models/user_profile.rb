class UserProfile < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_profile

  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :identification_image, ImageUploader
end

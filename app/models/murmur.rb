class Murmur < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  enum status: { draft: 0, published: 1}
end

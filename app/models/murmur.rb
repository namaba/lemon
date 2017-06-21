class Murmur < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user
  has_many :comments, :class_name => "MurmurComment", :foreign_key => 'murmur_id'


  mount_uploader :image, ImageUploader

  enum status: { draft: 0, published: 1}
end

class Announcement < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user

  enum status: { deleted: 0, published:1 }


  class << self
    def valid
      self.where.not(status: 0)
    end


  end


end

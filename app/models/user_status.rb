class UserStatus < ActiveRecord::Base
  belongs_to :user

  def self.reduce_coin
    if self.good_count > 0
      self.good_count -= 1
    elsif self.free_coin > 0
      self.free_coin -= 1
    elsif self.pay_coin > 0
      self.pay_coin -= 1
    else
      false
    end
  end
end

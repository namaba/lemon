class Tasks::Batch
  def self.execute
    free_users = UserStatus.where(id: User.where(id: UserProfile.normal.ids))
    free_users.update_all(good_count: 25)
  end

  def self.premium
    paying_users = UserStatus.where(id: User.where(id: UserProfile.paying_users.ids))
    paying_users.update_all(good_count: 50)
    paying_users.each do |user|
      user.free_coin += 5
      user.save!
    end
  end
end

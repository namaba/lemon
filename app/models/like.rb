class Like < ActiveRecord::Base
  acts_as_paranoid


  belongs_to :user
  belongs_to :target, :class_name => "User"

  enum is_liked: { no_liked: 0, be_liked: 1 }
  enum is_like: { no_like: 0, like: 1 }
  enum status: { no_match: 0, matched: 1 }
end

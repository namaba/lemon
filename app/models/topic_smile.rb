class TopicSmile < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :topic
end

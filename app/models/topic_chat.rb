class TopicChat < ActiveRecord::Base
  belongs_to :community
  belongs_to :user
  belongs_to :topic
end

class Topic < ActiveRecord::Base
  belongs_to :community
  belongs_to :user
  has_many :chats, :class_name => "TopicChat", :foreign_key => 'topic_id'
end

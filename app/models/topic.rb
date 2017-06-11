class Topic < ActiveRecord::Base
  belongs_to :community
  belongs_to :writer, :class_name => "User", :foreign_key => 'user_id'
  has_many :chats, :class_name => "TopicChat", :foreign_key => 'topic_id'
end

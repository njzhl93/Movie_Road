class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :content, :receive_id, :user_id
end
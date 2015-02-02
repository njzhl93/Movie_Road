class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'user_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'receive_id'

  validates :content, presence: true, length: { maximum: 160 }
  validates :user_id,    presence: true, numericality: { only_integer: true }
  validates :receive_id,      presence: true, numericality: { only_integer: true }
end
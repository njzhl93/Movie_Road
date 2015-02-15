class Comment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_many :replies
  default_scope {order('comments.created_at DESC')}
        def self.from_users_followed_by(user)
          followed_user_ids = "SELECT followed_id FROM relationships
                               WHERE follower_id = :user_id"
          where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",user_id: user.id)
      end
end

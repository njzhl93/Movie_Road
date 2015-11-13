class Movie < ActiveRecord::Base
	has_many :comments ,dependent: :destroy
	has_many :ratings
  has_attached_file :image,
                    :url  => '/images/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/images/:id/:style/:basename.:extension'
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/png)

  def self.search(search)
    where("name like ?", "%#{search}%")
  end

  def average_rating
    ratings.sum(:score) / (ratings.size.nonzero? || 1)
  end

  def self.show_favorites(user)
    favorites = "SELECT favorited_id FROM favorites WHERE user_id = :user_id"
    where("id in (#{favorites})", user_id: user.id)
  end
end

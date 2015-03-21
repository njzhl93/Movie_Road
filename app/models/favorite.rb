class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  def self.show_favorites(user)
  	favorites = current_user.favorites
    @favorite_movies = where ("favorited_id IN(?)" ,favorites)
  end
end

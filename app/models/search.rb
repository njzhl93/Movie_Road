class Search < ActiveRecord::Base
	def movies
		@movies ||= find_movies
	end

	private
	  def find_movies
	  	movies = Movie.order(:name)
	  	movies = movies.where("imdb like ?", "%#{imdb}%") if imdb.present?
	  	movies = movies.where("name like ?", "%#{name}%") if name.present?
	  	movies = movies.where("director like ?", "%#{director}%") if director.present?
	  	movies = movies.where("actors like ?", "%#{actors}%") if actors.present?
	  	movies
	  end
end

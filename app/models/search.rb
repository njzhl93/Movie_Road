class Search < ActiveRecord::Base
	def movies
		@movies ||= find_movies
	end

	private
	  def find_movies
	  	movies = Movie.order(:name)
	  	movies = movies.where("name like ?", "#{imdb}") if imdb.present?
	  	movies = movies.where("name like ?", "#{name}") if name.present?
	  	movies = movies.where("name like ?", "#{director}") if director.present?
	  	movies = movies.where("name like ?", "#{actors}") if actors.present?
	  end
end

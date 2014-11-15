class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

  def new
  	@movie = Movie.new
  end

  def create
  	secure_params = params.require(:movie).
  	                               permit(:imdb, :name, :director, :actors, :genre, :duration, :date, :content)
  	@movie = Movie.new(secure_params)
  	if @movie.save
  		redirect_to action: 'index', notice: 'Movie was successfully created.'
  	else
  		render action: "new"
    end
  end
end

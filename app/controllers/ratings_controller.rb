class RatingsController < ApplicationController

  def update
  	puts "a"
    @rating = Rating.find(params[:id])
    @movie = @rating.movie
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
    puts "b"
  end

end
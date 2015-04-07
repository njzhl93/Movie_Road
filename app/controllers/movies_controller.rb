class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def index

    @movies = Movie.paginate(page: params[:page])

    if params[:search]
      @movies = Movie.search(params[:search]).order(:name)
    else
      @movies = Movie.order(:name)
    end    

  end

  def show
  if current_user
    @rating = Rating.where(movie_id: @movie.id, user_id: current_user.id).first
  unless @rating
    @rating = Rating.create(movie_id: @movie.id, user_id: current_user.id, score: 0)
  end
  end
  end


  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
   # @movie = Movie.new(movie_params)
    @movie = Movie.create(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(:image => params[:movie][:image])
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
    

  end

  private
  
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:imdb, :name, :director, :actors, :genre, :duration, :date, :content, :image)
    end

   def admin_user
    redirect_to(root_path) unless current_user.admin?
   end
end

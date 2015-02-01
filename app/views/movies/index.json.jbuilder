json.array!(@movies) do |movie|
  json.extract! movie, :id, :imdb, :name, :director, :actors, :genre, :duration, :date, :content
  json.url movie_url(movie, format: :json)
end

class Movie < ActiveRecord::Base
	validates :imdb, presence: true
	validates :name, presence: true , length: { maximum: 50 }
	validates :duration, :numericality => {:only_integer => true}
end

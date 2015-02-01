class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :imdb
      t.string :name
      t.string :director
      t.string :actors
      t.string :genre
      t.integer :duration
      t.string :date
      t.text :content

      t.timestamps
    end
  end
end

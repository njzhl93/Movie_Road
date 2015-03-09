class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :imdb
      t.string :name
      t.string :director
      t.string :actors

      t.timestamps
    end
  end
end

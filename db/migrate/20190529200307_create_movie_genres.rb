class CreateMovieGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_genres do |t|
      t.references :movie
      t.references :genre
      t.timestamps
    end
  end
end

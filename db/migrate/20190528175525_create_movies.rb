class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string  :title
      t.string  :genre
      t.string  :year
      t.string  :actors
      t.float   :imdbRating
    end
  end
end

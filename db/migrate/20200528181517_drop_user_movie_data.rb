class DropUserMovieData < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_movie_data
  end
end

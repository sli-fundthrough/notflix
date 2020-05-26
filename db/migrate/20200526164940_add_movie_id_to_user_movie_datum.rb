class AddMovieIdToUserMovieDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :user_movie_data, :movie_id, :int
  end
end

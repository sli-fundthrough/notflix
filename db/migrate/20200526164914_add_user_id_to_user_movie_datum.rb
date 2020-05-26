class AddUserIdToUserMovieDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :user_movie_data, :user_id, :int
  end
end

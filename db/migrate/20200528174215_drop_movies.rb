class DropMovies < ActiveRecord::Migration[6.0]
  def change
    drop_table :movies
  end
end

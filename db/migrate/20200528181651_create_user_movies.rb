class CreateUserMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_movies do |t|
      t.integer :movie_id
      t.integer :rating
      t.text :notes

      t.timestamps
    end
  end
end

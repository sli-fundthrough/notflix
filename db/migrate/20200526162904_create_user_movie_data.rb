class CreateUserMovieData < ActiveRecord::Migration[6.0]
  def change
    create_table :user_movie_data do |t|
      t.text :notes
      t.integer :rating

      t.timestamps
    end
  end
end

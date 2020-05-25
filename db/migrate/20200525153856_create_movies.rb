class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.numeric :length
      t.text :overview
      t.datetime :date_published

      t.timestamps
    end
  end
end

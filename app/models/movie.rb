class Movie < ApplicationRecord
  has_many :user_movie_data

  validates :title, presence: true # validates required fields
  validates :overview, presence: true

end
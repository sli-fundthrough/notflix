class Movie < ApplicationRecord
  validates :title, presence: true # validates required fields
  validates :overview, presence: true

end
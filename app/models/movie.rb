class Movie < ApplicationRecord
  validates :title, presence: true # validates required fields
  validates :length, presence: true
  validates :overview, presence: true

end
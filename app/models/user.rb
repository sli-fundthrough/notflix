class User < ApplicationRecord
  validates :username, presence: true # validates required fields
  validates :password, presence: true


end

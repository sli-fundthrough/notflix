class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :user_movies

  validates :name, presence: true,
                       length: { minimum: 3, maximum: 25 },
                       uniqueness: { case_sensitive: false }
  validates :password, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
end

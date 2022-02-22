class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates_presence_of :name
  validates_presence_of :age
end

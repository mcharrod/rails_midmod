class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre
end

class Movie < ApplicationRecord
  belongs_to :studio

  validates_presence_of :title
  validates_presence_of :creation_year
  validates_presence_of :genre
end

require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'attributes' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end

  it '#ordered_actors' do
    studio1 = Studio.create!(name: "Studio", location: "location")
    movie1 = studio1.movies.create!(title: "title", creation_year: 2005, genre: "genre")

    actor1 = movie1.actors.create!(name: "name", age: 5)
    actor2 = movie1.actors.create!(name: "name", age: 15)
    actor3 = movie1.actors.create!(name: "name", age: 10)

    expect(movie1.ordered_actors).to eq([ actor1, actor3, actor2 ])
  end

  it '#average_age' do
    studio1 = Studio.create!(name: "Studio", location: "location")
    movie1 = studio1.movies.create!(title: "title", creation_year: 2005, genre: "genre")

    actor1 = movie1.actors.create!(name: "name", age: 5)
    actor2 = movie1.actors.create!(name: "name", age: 15)
    actor3 = movie1.actors.create!(name: "name", age: 10)

    expect(movie1.average_age).to eq(10)
  end
end

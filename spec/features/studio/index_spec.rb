require 'rails_helper'

describe 'studio index' do
  it 'lists each studio name, location, and movies' do
    studio1 = Studio.create!(name: "Studio 1", location: "Location 1")
    studio2 = Studio.create!(name: "Studio 2", location: "Location 2")
    studio3 = Studio.create!(name: "Studio 3", location: "Location 3")

    movie1 = studio1.movies.create!(title: "title 1", creation_year: 1999, genre: "horror")
    movie2 = studio1.movies.create!(title: "title 2", creation_year: 2000, genre: "comedy")

    visit '/studios'

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)

    expect(page).to have_content(studio2.name)
    expect(page).to have_content(studio2.location)

    expect(page).to have_content(studio3.name)
    expect(page).to have_content(studio3.location)

    within "#studio-#{studio1.id}" do
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end
  end
end

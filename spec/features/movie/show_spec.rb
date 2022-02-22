require 'rails_helper'

describe 'movie show' do
  it 'displays all movie information' do
    studio1 = Studio.create!(name: "Studio 1 studios", location: "location 1")
    movie1 = studio1.movies.create!(title: "Title 1", creation_year: 2000, genre: "Comedy")

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.title)
  end
end

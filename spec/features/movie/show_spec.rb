require 'rails_helper'

describe 'movie show' do
  it 'displays all movie information' do
    studio1 = Studio.create!(name: "Studio 1 studios", location: "location 1")

    movie1 = studio1.movies.create!(title: "Title 1", creation_year: 2000, genre: "Comedy")

    actor2 = movie1.actors.create!(name: "Actor 2", age: 10)
    actor1 = movie1.actors.create!(name: "Actor 1", age: 3)
    actor3 = movie1.actors.create!(name: "Actor 3", age: 20)

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content("Average actor age: #{movie1.average_age}")
  end
end

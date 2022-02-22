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
    expect(page).to have_content(movie1.genre)

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)

    expect(page).to have_content("Average actor age: #{movie1.average_age}")
  end

  it 'has a form on the same page to add an actor to the movie' do
    studio1 = Studio.create!(name: "Studio 1 studios", location: "location 1")

    movie1 = studio1.movies.create!(title: "Title 1", creation_year: 2000, genre: "Comedy")
    movie2 = studio1.movies.create!(title: "Title", creation_year: 2020, genre: "Sci fi")

    actor1 = movie1.actors.create!(name: "Actor 1", age: 3)
    actor2 = movie1.actors.create!(name: "Actor 2", age: 10)
    actor3 = movie1.actors.create!(name: "Actor 3", age: 20)

    # not part of movie 1 actors
    actor4 = movie2.actors.create!(name: "Actor 4", age: 30)

    visit "/movies/#{movie1.id}"

    expect(page).not_to have_content(actor4.name)
    expect(page).to have_content("Add an actor to this movie")

    fill_in "Actor name", with: "Actor 4"
    click_button "Save"

    expect(current_path).to eq("/movies/#{movie1.id}")
    expect(page).to have_content(actor4.name)
  end
end

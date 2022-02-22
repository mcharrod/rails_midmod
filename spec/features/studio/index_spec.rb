require 'rails_helper'

describe 'studio index' do
  it 'lists each studio name and location' do
    studio1 = Studio.create!(name: "Studio 1", location: "Location 1")
    studio2 = Studio.create!(name: "Studio 2", location: "Location 2")
    studio3 = Studio.create!(name: "Studio 3", location: "Location 3")

    visit '/studios'

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)

    expect(page).to have_content(studio2.name)
    expect(page).to have_content(studio2.location)

    expect(page).to have_content(studio3.name)
    expect(page).to have_content(studio3.location)
  end
end

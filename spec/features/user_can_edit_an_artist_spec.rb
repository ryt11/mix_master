require 'rails_helper'
require_relative '../spec_helper'


RSpec.describe "As a user edits an artist" do
  before(:each) {Artist.create(name:"Tupac", image_path:"http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg")}

  it "updates the artist at the #index and #show actions" do
    artist_image_path = 'http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg'
    visit artists_path
    expect(page).to have_content("Tupac")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    click_on "Tupac"
    expect(current_path).to eq("/artists/1")
    click_on "Edit Artist"
    expect(current_path).to eq("/artists/1/edit")
    fill_in 'artist[name]', with: "Tupac Edit"
    fill_in 'artist[image_path]', with: "http://www.onyxtruth.com/wp-content/uploads/2015/12/Tupac-Rape-Onyx-Truth.jpg"
    click_on "Update"
    artist_image_path = "http://www.onyxtruth.com/wp-content/uploads/2015/12/Tupac-Rape-Onyx-Truth.jpg"
    expect(current_path).to eq("/artists/1")
    within('h1') do
      expect(page).to have_content("Tupac Edit")
    end
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

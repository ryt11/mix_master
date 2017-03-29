require 'rails_helper'
require_relative '../spec_helper'


RSpec.describe "As a user deletes an artist" do
  before(:each) {Artist.create(name:"Tupac", image_path:"http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg")}

  it "removes the artist from index" do
    artist_image_path = 'http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg'
    visit artists_path
    expect(page).to have_content("Tupac")
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
    click_on "Tupac"
    expect(current_path).to eq("/artists/1")
    click_on "Delete Artist"
    expect(current_path).to eq("/artists")
    expect(page).not_to have_content("Tupac")
    expect(page).not_to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

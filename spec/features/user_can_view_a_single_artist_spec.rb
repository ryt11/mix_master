require 'rails_helper'
require_relative '../spec_helper'


RSpec.describe "As a user clicks on an artist" do
  before(:each) {Artist.create(name:"Tupac", image_path:"http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg")}
  it "takes user to correct path for that artist ID and displays all content" do
    visit artists_path
    artist_image_path = 'http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg'
    click_on "Tupac"
    expect(current_path).to eq("/artists/1")

    within("h1") do
      expect(page).to have_content("Tupac")
    end
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end

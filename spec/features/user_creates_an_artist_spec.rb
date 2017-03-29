require 'rails_helper'

ARTIST_IMAGE_PATH = 'http://cbsnews1.cbsistatic.com/hub/i/2011/06/15/3eb74f30-a643-11e2-a3f0-029118418759/tupac_shakur.jpg'

RSpec.describe "As a user visits the artist index" do
  it "can create new artist and be redirected to see new content on index page" do
    visit artists_path
    click_on "Create New Artist"
    fill_in "artist[name]", with: "Tupac"
    fill_in "artist[image_path]", with: ARTIST_IMAGE_PATH
    click_on "Create Artist"
    expect(page).to have_content("Tupac")
    expect(page).to have_css("img[src=\"#{ARTIST_IMAGE_PATH}\"]")
  end

  it "notifies user that a field is required if left blank" do
    visit artists_path
    click_on "Create New Artist"
    fill_in "artist[image_path]", with: ARTIST_IMAGE_PATH
    click_on "Create Artist"
    expect(page).to have_content "Name can't be blank"
  end
end

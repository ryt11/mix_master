require 'rails_helper'
require_relative '../spec_helper'


RSpec.feature "User Submits a New Song" do
  scenario "they see a page for the individual song" do
    artist = create(:artist)

    song_title = "One Love"

    visit artist_path(artist)

    click_on "New Song"
    fill_in "song[title]", with: song_title
    click_on "Create Song"

    expect(page).to have_content(song_title)
    expect(page).to have_link artist.name, href: artist_path(artist)

  end
end

# /spec/features/albums/visitor_deletes_album_spec.rb
require 'rails_helper'

feature 'Visitor deletes the album' do
  setup :activate_authlogic

  let(:user) { create(:user) }
  given!(:album) { Album.create!(name: 'Some name', user: user) }

  scenario do
    as_user(user) do
      visit albums_path
      click_link 'Delete'
      expect(page).to have_content('success')
    end
  end
end

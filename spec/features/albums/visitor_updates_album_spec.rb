# /spec/features/albums/visitor_updates_album_spec.rb
require 'rails_helper'

feature 'Visitor updates the album' do
  setup :activate_authlogic

  let(:user) { create(:user) }
  given!(:album) { Album.create!(name: 'Some name', user: user) }

  scenario 'edited the album with valid name' do
    as_user(user) do
      update_album(album, 'New name for album')
      expect(page).to have_content('success')
    end
  end

  scenario 'failure to update the album with invalid name' do
    as_user(user) do
      update_album(album, '')
      expect(page).to have_selector('.alert')
    end
  end

end

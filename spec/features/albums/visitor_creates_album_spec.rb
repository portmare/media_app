# /spec/features/albums/visitor_creates_album_spec.rb
require 'rails_helper'

feature 'Visitor creates an album', type: :feature do
  setup :activate_authlogic

  let(:user) { create(:user) }

  scenario 'created new album with valid name' do
    as_user(user) do
      create_new_album('New album')
      expect(page).to have_content('success')
    end
  end

  scenario 'failure to create new album with invalid params' do
    as_user(user) do
      create_new_album('')
      expect(page).to have_selector('.alert')
    end
  end
end

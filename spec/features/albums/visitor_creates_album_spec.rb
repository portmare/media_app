# /spec/features/albums/visitor_creates_album_spec.rb
require 'rails_helper'

feature 'Visitor creates an album' do
  setup :activate_authlogic

  before(:each) do
    UserSession.create(build(:user))
  end

  scenario 'created new album with valid name' do
    create_new_album('New album')
    expect(page).to have_content('success')
  end

  scenario 'failure to create new album with invalid params' do
    create_new_album('')
    expect(page).to have_selector('.alert')
  end
end

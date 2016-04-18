# /spec/features/visitor_sings_up_spec.rb
require 'rails_helper'

feature 'Visitor signs up', type: :feature do
  scenario 'with valid name, email and password' do
    sign_up_with attributes_for(:user)
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid params: nil name' do
    sign_up_with attributes_for(:user, name: nil)
    expect(page).to have_selector('.alert')
  end

  scenario 'with different password' do
    sign_up_with attributes_for(:user, :different_password)
    expect(page).to have_selector('.alert')
  end
end

feature 'Visitor signs in', type: :feature do
  let(:user) { build(:user) }

  scenario 'with valid email and password' do
    sign_in_with user.email, user.password
    expect(page).to have_content(user.name)
  end

  scenario 'with invalid params' do
    sign_in_with user.email, 'abracadabra'
    expect(page).to have_content('Sign in')
  end
end
# /spec/features/visitor_sings_up_spec.rb
require 'rails_helper'

feature 'Visitor signs up', type: :feature do
  scenario 'with valid name, email and password' do
    sign_up_with attributes_for(:user)

    expect(page).to have_content('Sign out')
  end
end
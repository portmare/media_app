# /spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up_with(name:, email:, password:, password_confirmation:)
      visit new_user_path
      fill_in 'user_name', with: name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      click_button 'Sign up'
    end

    def sign_in_with(email, password)
      user = create(:user)
      visit sign_in_path
      fill_in 'user_session_email', with: email
      fill_in 'user_session_password', with: password
      click_button 'Sign in'
    end
  end
end
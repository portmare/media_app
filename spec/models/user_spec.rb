# /spec/models/user_spec.rb
require 'rails_helper'

describe User, type: :model do
  context 'user attributes validations' do
    it 'user with all attributes should be a valid' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'empty name not valid' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it 'email should be present' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'email should be in a valid format' do
      user = build(:user, email: 'qwerty&&123...@adsf.com')
      expect(user).not_to be_valid
    end

    it 'email should be unique' do
      user1 = create(:user)
      user2 = build(:user)
      expect(user2).not_to be_valid
    end

    it 'password should be present' do
      user = build(:user, password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
    end

    it 'length of password should be not short' do
      user = build(:user, password: 'short', password_confirmation: 'short')
      expect(user).not_to be_valid
    end

    it 'password should be confirmated' do
      user = build(:user, password: 'onepassword', password_confirmation: 'anotherpassword')
      expect(user).not_to be_valid
    end
  end
end

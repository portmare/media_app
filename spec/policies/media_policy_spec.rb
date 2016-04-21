# /spec/policies/media_policy_spec.rb
require 'rails_helper'

describe MediaPolicy do
  subject { described_class }

  permissions :new?, :create?, :destroy? do
    it 'denied access if current user id nil' do
      expect(subject).not_to permit(nil, build_stubbed(:media))
    end

    it 'denied access if current user is not owner of media' do
      user = build_stubbed(:user, email: 'new@email.com')
      media = build_stubbed(:media)
      expect(subject).not_to permit(user, media)
    end

    it 'grants access if current user is owner of media' do
      user = build_stubbed(:user)
      album = build_stubbed(:album, user: user)
      media = build_stubbed(:media, album: album)
      expect(subject).to permit(user, media)
    end
  end
end

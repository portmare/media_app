# /spec/policies/album_policy_spec.rb
require 'rails_helper'

describe AlbumPolicy do
  subject { described_class }

  permissions :index?, :new?, :create? do
    it 'denied access if current user is nil' do
      expect(subject).not_to permit(nil, Album.new)
    end

    it 'grants access if current user is present' do
      expect(subject).to permit(build_stubbed(:user), Album.new)
    end
  end

  permissions :edit?, :update?, :destroy? do
    let(:album) { create(:album) }

    it 'denied access if current user is not owner of the album' do
      expect(subject).not_to permit(create(:user, email: 'other@email.com'), album)
    end

    it 'grants access if current_user is owner of the album' do
      expect(subject).to permit(album.user, album)
    end
  end
end
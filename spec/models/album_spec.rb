# /spec/models/album_spec.rb
require 'rails_helper'

describe Album, type: :model do
  context 'album attributes validations' do
    it 'album with all attributes should be a valid' do
      album = build(:album)
      expect(album).to be_valid
    end

    it 'with empty name is not valid' do
      album = build(:album, name: nil)
      expect(album).not_to be_valid
    end

    it 'with empty user is not valid' do
      album = build(:album, user: nil)
      expect(album).to be_invalid
    end

    it 'with generated token is valid' do
      album = create(:album)
      expect(album.token).not_to be_nil
    end
  end

  it 'delete token key when delete album' do
    album = create(:album)
    expect { album.destroy }.to change { TokenKey.count }.by(-1)
  end
  
  it 'delete album when delete album' do
    album = create(:album)
    expect { album.destroy }.to change { Album.count }.by(-1)
  end

  it 'delegate token to token key' do
    album = create(:album)
    expect(album.token).not_to be_nil
  end
end

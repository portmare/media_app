# /spec/helpers/album_helper_spec.rb
require 'rails_helper'

describe AlbumHelper, type: :helper do
  describe '#title_image' do
    it 'displays image tag if media collection is not empty' do
      media = create(:media)
      expect(helper.title_image(media.album)).to match /<img (.*)>/
    end

    it 'return nil if media collection is empty' do
      album = build_stubbed(:album)
      expect(helper.title_image(album)).to be_nil
    end
  end

  describe '#shared_button' do
    describe 'album is persisted' do
      let(:album) { create(:album) }

      before(:each) do
        assign(:album, album)
      end

      it 'displays link with text #Share# if access = 0' do
        expect(helper.shared_button).to match /<a (.*)>Share<\/a>/
      end

      it 'displays link with text #Share# if access = 1' do
        allow(album.token_key).to receive(:access).and_return('shared')
        expect(helper.shared_button).to match /<a (.*)>Close share<\/a>/
      end
    end

    it 'return nil if album is not persisted' do
      assign(:album, Album.new)
      expect(helper.shared_button).to be_nil
    end
  end

  describe '#album_token' do
    describe 'album is persisted' do
      let(:album) { create(:album) }

      before(:each) do
        assign(:album, album)
      end

      it 'displays input field with token if album is shared' do
        allow(album.token_key).to receive(:closed?).and_return(false)
        expect(helper.album_token).to match album.token
      end

      it 'return nil if album is closed' do
        expect(helper.album_token).to be_nil
      end
    end

    it 'return nil if album is not persisted' do
      assign(:album, Album.new)
      expect(helper.album_token).to be_nil
    end
  end
end

# /spec/models/media_spec.rb
require 'rails_helper'

describe Media, type: :model do
  it 'created with valid params' do
    image = build(:media)
    expect(image).to be_valid
  end

  it 'not created with empty image' do
    image = build(:media, image: nil)
    expect(image).to be_invalid
  end

  it 'not created with empty album' do
    image = build(:media, album: nil)
    expect(image).to be_invalid
  end

  it 'upload image from remote server if link not nil' do
    external = 'http://www.google.com/images/errors/robot.png'
    media = Media.create(album: build_stubbed(:album), link: external)
    expect(media).to be_valid
    expect(media.image.identifier).to eq('robot.png')
  end
end

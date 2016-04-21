# /spec/views/albums/edit.html.slim_spec.rb
require 'rails_helper'

describe 'albums/edit' do
  let(:album) { build_stubbed(:album, token_key: build_stubbed(:token_key)) }

  before(:each) do
    assign(:album, album)
  end

  it 'displays a title #Edit album#' do
    render
    expect(rendered).to have_content('Edit album')
  end

  it 'displays a text field that contain album name' do
    render
    expect(rendered).to have_field('album_name', with: album.name)
  end

  it 'displays a link #Add new image' do
    render
    expect(rendered).to have_link('Add new image')
  end
end

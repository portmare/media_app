# /spec/views/albums/index.html.slim_spec.rb
require 'rails_helper'

describe 'albums/index' do
  let(:album) { build_stubbed(:album) }

  it 'displays a link to add a new album' do
    render
    expect(rendered).to have_link('Add new album')
  end

  it 'displays a link to an exists album' do
    assign(:albums, [album])
    render
    expect(rendered).to have_link(album.name)
  end
end

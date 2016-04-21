# /spec/views/media/new.html.slim_spec.rb
require 'rails_helper'

describe 'media/new' do
  before(:each) do
    assign(:media, Media.new)
    assign(:album, build_stubbed(:album))
  end

  it 'displays text input for link' do
    render
    expect(rendered).to have_field('media_link')
  end

  it 'displays file field for image' do
    render
    expect(rendered).to have_field('media_image')
  end

  it 'displays button #Upload' do
    render
    expect(rendered).to have_button('Upload')
  end

  it 'displays title #Add new image' do
    render
    expect(rendered).to have_content('Add new image')
  end
end

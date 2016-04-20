# /spec/views/albums/new.html.slim_spec.rb
require 'rails_helper'

describe 'albums/new' do
  before(:each) do
    assign(:album, Album.new)
  end

  it 'displays a text field to input name of album' do
    render
    expect(rendered).to have_selector('#album_name')
  end

  it 'displays a title #Add new album#' do
    render
    expect(rendered).to have_content('Add new album')
  end
end

require 'rails_helper'

describe 'main/index' do
  it 'displays the header' do
    render

    expect(rendered).to have_content 'MEDIA COLLECTIONS'
  end
end

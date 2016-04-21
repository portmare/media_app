# /spec/features/images/visitor_create_image_spec.rb
require 'rails_helper'

feature 'Visitor create new image' do
  setup :activate_authlogic

  let(:user) { create(:user) }
  let(:album) { Album.create!(name: 'My first album', user: user) }
  let(:path_to_file) { Rails.root.join(*%w[spec fixtures test_image.png]) }

  before do
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(album, :image)

    File.open(path_to_file) do |f|
      @uploader.store!(f)
    end
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  scenario 'with valid image' do
    as_user(user) do
      create_new_image_with_image(album, path_to_file)
      expect(page).to have_content('success')
    end
  end

  scenario 'with valid link' do
    as_user(user) do
      create_new_image_with_link(album, 'http://www.google.com/images/errors/robot.png')
      expect(page).to have_content('success')
    end
  end

  scenario 'with empty image' do
    as_user(user) do
      create_new_image_with_link(album, nil)
      expect(page).to have_selector('.alert')
    end
  end
end

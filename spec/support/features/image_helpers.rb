# /spec/support/features/image_helpers.rb
module Features
  module ImageHelpers
    def create_new_image_with_image(album, image)
      visit edit_album_path(album)
      click_link 'Add new image'
      attach_file('media_image', image)
      click_button 'Upload'
    end

    def create_new_image_with_link(album, link)
      visit edit_album_path(album)
      click_link 'Add new image'
      fill_in 'media_link', with: link
      click_button 'Upload'
    end
  end
end
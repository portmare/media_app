# /spec/support/features/album_helpers.rb
module Features
  module AlbumHelpers
    def create_new_album(name)
      visit albums_path
      expect(page).to have_content('Your media')
      click_link 'Add new album'
      fill_in 'album_name', with: name
      click_button 'Save'
    end

    def update_album(album, name)
      visit albums_path
      click_link album.name
      fill_in 'album_name', with: name
      click_button 'Save'
    end
  end
end

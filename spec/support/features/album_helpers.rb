# /spec/support/features/album_helpers.rb
module Features
  module AlbumHelpers
    def create_new_album(name)
      visit root_path
      click_link 'New album'
      fill_in 'album_name', with: name
      click_button 'Save'
    end

    def update_album(album, name)
      visit root_path
      click_link album.name
      fill_in 'album_name', with: name
      click_button 'Save'
    end
  end
end

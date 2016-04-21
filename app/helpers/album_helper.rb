# /app/helpers/album_helper.rb
module AlbumHelper
  def title_image(album)
    image_tag(album.medias.first.image, class: 'img-responsive') if album.medias.present?
  end
end
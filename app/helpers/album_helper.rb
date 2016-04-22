# /app/helpers/album_helper.rb
module AlbumHelper
  def title_image(album, html_opt = { class: 'img-responsive' })
    image_tag(album.medias.first.image, html_opt) if album.medias.present?
  end

  def shared_button(html_opt = { class: 'btn btn-warning', method: :patch })
    return if @album.new_record?
    text = @album.token_key.access == "closed" ? 'Share' : 'Close share'
    link_to(text, token_key_path(@album.token), html_opt)
  end

  def album_token(html_opt = { class: 'form-control' })
    return if @album.new_record? || @album.token_key.closed?
    content_tag(:input, '', html_opt.merge!(value: token_key_url(@album.token), type: 'text'))
  end
end
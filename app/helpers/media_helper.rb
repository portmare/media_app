# /app/helpers/media_helper.rb
module MediaHelper
  def link_to_delete(media, html_opt = { method: :delete, class: 'btn btn-danger' })
    link_to("#{icon('trash-o')} Delete".html_safe, medium_path(media), html_opt) if current_user.present?
  end
end

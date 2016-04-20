# /app/controller/token_keys_controller.rb
class TokenKeysController < ApplicationController
  before_filter :require_no_user

  def show
    resource = TokenKey.find_by(token: params[:token])
    if resource.shared?
      render "#{resource.tokenable.class.name.downcase.pluralize}/show", object: resource.tokenable
    else
      redirect_to root_path
    end
  end
end
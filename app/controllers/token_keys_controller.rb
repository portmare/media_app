# /app/controller/token_keys_controller.rb
class TokenKeysController < ApplicationController
  before_filter :require_no_user, only: :show
  after_action :verify_authorized, only: :update
  before_filter :set_resource

  def show
    if @resource.shared?
      render "#{@resource.tokenable.class.name.downcase.pluralize}/show", locals: { object: @resource.tokenable }
    else
      redirect_to root_path
    end
  end

  def update
    authorize @resource.tokenable
    if @resource.closed?
      @resource.update(access: 'shared')
    else
      @resource.update(access: 'closed')
    end
    redirect_to url_for(@resource.tokenable) + '/edit'
  end

  private

  def set_resource
    @resource = TokenKey.find_by(token: params[:token])
  end
end
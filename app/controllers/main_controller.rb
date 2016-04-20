class MainController < ApplicationController
  def index
    if current_user
      redirect_to albums_path
    else
      render :index
    end
  end
end
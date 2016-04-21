# /app/controllers/albums_controller.rb
class AlbumsController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :set_album, only: [:edit, :update, :destroy]

  def index
    authorize Album
    @albums = policy_scope(Album)
  end

  def new
    authorize Album
    @album = Album.new
  end

  def create
    authorize Album
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path, notice: 'Album created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: 'Album updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: 'Album deleted successfully'
  end

  private

  def album_params
    params.require(:album).permit(:name).merge(user: current_user)
  end

  def set_album
    @album = Album.find(params[:id])
    authorize @album
  end
end

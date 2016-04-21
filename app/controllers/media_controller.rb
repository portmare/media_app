# /app/controllers/media_controller.rb
class MediaController < ApplicationController
  after_action :verify_authorized
  before_action :set_album, except: :destroy

  def new
    @media = @album.medias.build
    authorize @media
  end

  def create
    @media = @album.medias.build(media_params)
    authorize @media

    if @media.save
      redirect_to edit_album_path(@media.album), notice: 'Your image added successfully'
    else
      render :new
    end
  end

  def destroy
    @media = Media.find(params[:id])
    authorize @media
    album = @media.album
    @media.destroy
    redirect_to edit_album_path(album), notice: 'Your image destroy successfully'
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def media_params
    params.require(:media).permit(:link, :image)
  end
end
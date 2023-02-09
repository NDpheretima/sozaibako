class ArtworksController < ApplicationController
  def illustration_new
    @artwork = Artwork.new
  end

  def music_new
    @artwork = Artwork.new
  end

  def illustration_show
    @artworks_illustration = Artwork.where(category: "illustration")
  end

  def music_show
    @artworks_music = Artwork.where(category: "music")
  end

  def create
    artwork = Artwork.new(artwork_params)
    artwork.user_id = current_user.id
    if artwork.save
      redirect_to user_path(artwork.user_id)
    else
      redirect_to request.referer
    end
  end

  def illustration_edit
    @artwork = Artwork.find(params[:id])
    if @artwork.user_id == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
  
  end

  def music_edit
    @artwork = Artwork.find(params[:id])
    if @artwork.user_id == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    redirect_to user_path(artwork.user_id)
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    redirect_to user_path(artwork.user_id)
  end

  def illustration_download
    @artwork = Artwork.find(params[:id])
    filepath = @artwork.illustration_file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @artwork.illustration_file_identifier, :length => stat.size)
  end

  def music_download
    @artwork = Artwork.find(params[:id])
    filepath = @artwork.music_file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @artwork.music_file_identifier, :length => stat.size)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :body, :category, :illustration_file, :music_file)
  end

end

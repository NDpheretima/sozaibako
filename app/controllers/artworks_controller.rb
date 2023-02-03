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
    artwork.save
    redirect_to user_path(artwork.id)
  end

  def illustration_edit
    @artwork = Artwork.find(params[:id])
  end

  def music_edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    redirect_to user_path(artwork.user_id)
  end

  def destroy
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :body, :category, :illustration_file, :music_file)
  end

end

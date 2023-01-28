class ArtworksController < ApplicationController
  def illustration_new
    @artwork = Artwork.new
  end

  def music_new
    @artwork = Artwork.new
  end

  def show
  end

  def create
    artwork = Artwork.new(artwork_params)
    artwork.user_id = current_user.id
    artwork.save
    redirect_to user_path(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :body, :category, :illustration_file, :music_file)
  end

end

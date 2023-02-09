class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @artworks_illustration = Artwork.where(user_id: @user.id).where(category: "illustration")
    @artworks_music = Artwork.where(user_id: @user.id).where(category: "music")
  end

  def edit
    @user = User.find(params[:id])
     # 本人は編集画面へ、それ以外の人は本人詳細へ
    if @user.id == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_file,:introduction)
  end

end

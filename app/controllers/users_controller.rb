class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:profile_image_file)
  end

end

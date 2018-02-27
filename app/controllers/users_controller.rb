class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def update
    @user = current_user
    update = @user.update(user_params)
    if @user.save
      redirect_to talk_rooms_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :thumbnail)
  end

end

class UsersController < ApplicationController
  def show
    @user = current_user
  end
  def update
    @user = current_user
    update = @user.update(user_params)
    if @user.save
      redirect_to groups_path
    end
  end
  def edit
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :thumbnail)
  end

end

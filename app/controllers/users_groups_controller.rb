class UsersGroupsController < ApplicationController
  def create
    @users_group = UsersGroup.new(users_group_params)
    if @users_group.save
      redirect_to edit_group_path(@users_group.group_id)
    else
    end
  end
  def destroy
    @users_group = UsersGroup.find(params[:id])
    @group = Group.find(@users_group.group_id)
    if @users_group.user_id == current_user.id
      @users_group.destroy!
      redirect_to groups_path
    else
      @users_group.destroy!
      redirect_to edit_group_path(@group)
    end
  end

  private
  def users_group_params
    params.require(:users_group).permit(:group_id, :user_id)
  end
end

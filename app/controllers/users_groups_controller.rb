class UsersGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @users_group = UsersGroup.new(users_group_params)
    if @users_group.save
    else
    end
  end
  private
    def users_group_params
      params.require(:users_group).permit(:user_id)
    end
end

class GroupsController < ApplicationController
  def index
    @more_groups = current_user.groups.where(status: :more)
    @pair_groups = current_user.groups.where(status: :pair)
  end
  def show
    @group = current_user.groups.find(params[:id])
    if @group.status == 'pair'
      @user = @group.another_user(current_user)
    else
      @user = @group
    end
  end

  def new
    @group = Group.new
    @group.users_groups.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    end
  end
  def talking
    @groups = current_user.groups.order(:updated_at)
  end

  private
    def group_params
      params.require(:group).permit(
        :name, :status,
        users_groups_attributes:[
          :id,
          :user_id,
          :group_id
        ]
      )
    end

end

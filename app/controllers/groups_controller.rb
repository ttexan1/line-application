class GroupsController < ApplicationController
  def index
    @more_groups = current_user.groups.where(status: :more)
    @pair_groups = current_user.groups.where(status: :pair)
  end
  def show
    @group = current_user.groups.find(params[:id])
    @room = @group.room(current_user)
  end

  def new
    @group = Group.new
    @group.users_groups.build
  end
  def edit
    @group = current_user.groups.find(params[:id])
    @room = @group.room(current_user)
  end
  def update
    @group = current_user.groups.find(params[:id])
    update = @group.update(group_only_params)
    if @group.save
      redirect_to groups_path
    else
      render 'edit'
    end
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      UsersGroup.create(user_id: current_user.id, group_id: @group.id)
      redirect_to groups_path
    else
      render 'new'
    end
  end
  def talking
    @groups = current_user.groups.order(:updated_at)
  end

  private
    def group_params
      params.require(:group).permit(
        :name, :status, :thumbnail, :thumbnail_cache, :remove_thumbnail,
        users_groups_attributes:[
          :id, :user_id, :group_id
        ]
      )
    end
    def group_only_params
      params.require(:group).permit(:name, :status, :thumbnail, :thumbnail_cache, :remove_thumbnail)
    end

end

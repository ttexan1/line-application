class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @group.users_groups.build
    @group.build_talk_room
  end

  def create
    @group = Group.new(group_params)
    @group.talk_room.name = @group.name
    if @group.save
      redirect_to talk_rooms_path
    end
  end

  private
    def group_params
      params.require(:group).permit(
        :name, :status,
        users_groups_attributes:[
          :id,
          :user_id,
          :group_id
        ],
        talk_room_attributes:[
          :id,
          :name,
          :group_id
        ]
      )
    end

end

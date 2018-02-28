class TalkRoomsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups.includes(:talk_room)
    @relationships = Relationship.all_relationships(@user)
  end
  def show
    @talk_room = TalkRoom.find(params[:id])
    @messages = @talk_room.messages
  end
end

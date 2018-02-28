class RelationshipsController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result
    @friend_ids = current_user.friends.pluck(:id)
    @friends = User.where(id: @friend_ids)
    @groups = current_user.groups
  end
  def show
    @friend = User.find(params[:id])
    @relationship = Relationship.find_by_from_or_to(@friend, current_user)
    @talk_room = @relationship.talk_room
  end
  def create
    @relationship = Relationship.new
    if @relationship.save
      redirect_to talk_rooms_path
    end
  end

  private
  def relation_params
    params.require(:relationship).permit(:from_user, :to_user)
  end
end

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
    @relationship = Relationship.find_by(from_user_id: @friend.id, to_user_id: current_user.id)
    logger.debug(@relationship.talk_room)
    logger.debug("@relationship.id")
    # || Relationship.find_by(from_user_id: @friend.id, to_user_id: current_user.id)
    @talk_room = @relationship.talk_room

  end
  def create
    # @relationship = Relationship.find_or_init_by(current_user.id,to_user)
    if @relationship.save
      redirect_to talk_rooms_path
    end
  end

  private
  def relation_params
    params.require(:relationship).permit(:from_user, :to_user)
  end
end

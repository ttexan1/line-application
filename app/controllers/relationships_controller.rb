class RelationshipsController < ApplicationController

  def show
    @friend = User.find(params[:id])
    @relationship = Relationship.find_by_from_or_to(@friend, current_user)
  end
  def new
    friend_ids = current_user.friends.pluck(:id).push(current_user.id)
    @q = User.where.not(id: friend_ids).ransack(params[:q])
    @users = @q.result
    @relationship = Relationship.new
  end
  def create
    @relationship = Relationship.new(relation_params)
    @relationship.from_user_id = current_user.id
    @relationship.create_group
    if @relationship.save
      redirect_to groups_path
    end
  end


  private
  def relation_params
    params.require(:relationship).permit(:status, :to_user_id)
  end
end

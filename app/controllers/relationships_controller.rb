class RelationshipsController < ApplicationController
  def index
    @friend_ids = current_user.friends.pluck(:id)
    @friends = User.where(id: @friend_ids)
    @q = User.where(id: @friend_ids).ransack(params[:q])
    @users = @q.result
    @groups = current_user.groups.order(:status)
  end
  def show
    @friend = User.find(params[:id])
    @relationship = Relationship.find_by_from_or_to(@friend, current_user)
  end
  def new
    friend_ids = current_user.friends.pluck(:id)
    friend_ids.push(current_user.id)
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

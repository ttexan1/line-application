class RelationshipsController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result
    @from_friends = current_user.from_users
    @to_friends = current_user.to_users
    @groups = current_user.groups
  end
  def show
    @friend = User.find(params[:id])
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

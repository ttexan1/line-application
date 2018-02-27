class RelationshipsController < ApplicationController
  def index
    @friends = current_user.friends
    logger.debug(@friends)
  end
  def create
    @relationships = Relationship.new(relation_params)
    if @relationship.save
      redirect_to talk_rooms_path
    end
  end

  private
  def relation_params
    params.require(:relationship).permit(:from_user, :to_user)
  end
end

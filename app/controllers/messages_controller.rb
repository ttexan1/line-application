class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @room = @group.room(current_user)
  end
  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.group_id = @group.id
    if @message.save
      redirect_to group_messages_path(@group)
    else
    end
  end


  private
    def message_params
      params.require(:message).permit(:content)
    end
end

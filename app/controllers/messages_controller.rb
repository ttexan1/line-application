class MessagesController < ApplicationController
  def create
    @talk_room = TalkRoom.find(params[:talk_room_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.talk_room_id = @talk_room.id
    if @message.save
      redirect_to talk_room_path(id: @talk_room)
    else
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end

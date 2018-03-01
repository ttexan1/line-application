class MessagesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.group_id = @group.id
    if @message.save
      redirect_to talking_group_path(@group)
    else
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end

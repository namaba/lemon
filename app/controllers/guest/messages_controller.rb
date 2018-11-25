class Guest::MessagesController < Guest

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to partnership_path(message.partnership_id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:partnership_id, :sender_id, :body, :image)
  end

end

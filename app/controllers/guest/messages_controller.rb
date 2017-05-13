class Guest::MessagesController < Guest
  before_action :set_user, only: [:show]

  def index
    @like_users = User.like_me(current_user)
  end

  def show
    @messages = Message.where(partnership_id: params[:id])
    # @messages = Message.find(5) if @messages.blank?
    redirect_to likes_path
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      redirect_to likes_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:partnership_id, :sender_id, :body, :image)
  end
end

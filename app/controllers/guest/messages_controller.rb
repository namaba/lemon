class Guest::MessagesController < Guest
  before_action :set_user, only: [:show]

  def index
    # @like_users = User.like_me(current_user)
    @message = Message.new
    @partnerships = Partnership.joins(:user).where("user_id = ? or target_id = ?", current_user, current_user)
    if @messages.nil?
      @messages = Message.where(partnership_id: @partnerships.first)
    end
  end

  def show
    @user = User.find(params[:id])
    render 'guest/users/preview'
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      redirect_to :index
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

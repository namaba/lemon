class Guest::MessagesController < Guest


  def index
    @partnerships = Partnership.joins(:user).where("user_id = ? or target_id = ?", current_user, current_user).page(params[:page]).per(4)
    @message = Message.new(partnership_id: @partnerships.first.id)
    @messages = Message.where(partnership_id: @partnerships.first)
  end

  def show
    @partnership = Partnership.find(params[:id])
    @partner = @partnership.user == current_user ? @partnership.target : @partnership.user
    @messages = Message.where(partnership_id: params[:id]).page(params[:page]).per(20)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to message_path(@message.partnership_id)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_partner
    @partner = User.find(params[:partner_id])
  end

  def message_params
    params.require(:message).permit(:partnership_id, :sender_id, :body, :image)
  end

end

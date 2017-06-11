class Guest::MessagesController < Guest

  def index
    @message = Message.new
    @partnerships = Partnership.joins(:user).where("user_id = ? or target_id = ?", current_user, current_user)
    @latest_partnership = Partnership.first
    if @messages.nil?
      @messages = Message.where(partnership_id: @partnerships.first)
    end
  end

  def show
    @partner = User.find(params[:user_id])
    @partnership = Partnership.find(params[:id])
    @message = Message.new
    @messages = Message.where(partnership_id: params[:id])
  end

  def create
    ActiveRecord::Base.transaction do
      @message = Message.create(message_params)
      if @message.save
        redirect_to @message
      end
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

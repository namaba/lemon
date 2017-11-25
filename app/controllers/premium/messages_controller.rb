class Premium::MessagesController < Premium
    before_action :set_user, only: [:profile]
    
  def index
    @pre_id = params[:user_id]
    @partnerships = Partnership.where("user_id = ? or target_id = ?", @pre_id, @pre_id)
    @message  = Message.new(partnership_id: @partnerships.first.id) if @partnerships.first
    @messages = Message.where(partnership_id: @partnerships.first).order("id").reverse_order.page(params[:page]).per(20) if @partnerships.first
  end

  def show
    @pre_id = params[:sender_id]
    @partnership = Partnership.find(params[:id])
    @partner = @partnership.user == current_user ? @partnership.target : @partnership.user
    @messages = Message.where(partnership_id: params[:id]).order("id").reverse_order.page(params[:page]).per(20)
    @message = Message.new
  end

  def create
    @pre_id = params[:user_id]
    @message = Message.new(message_params)
    if @message.save
      redirect_to premium_message_path(@message.partnership_id) 
    end
  end

  def profile
    @partnership = params[:partnership_id].to_i
    @partner = params[:partnership].to_i
    render 'guest/users/preview'
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

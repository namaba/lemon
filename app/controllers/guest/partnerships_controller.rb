class Guest::PartnershipsController < Guest
  def index
    @partnerships = current_user.partnerships.page(params[:page]).per(4)
    @message  = Message.new(partnership_id: @partnerships.first.id) if @partnerships.first
    @messages = Message.where(partnership_id: @partnerships.first).order("id").reverse_order.page(params[:page]).per(20) if @partnerships.first
  end

  def show
    @partnership = current_user.partnerships.find(params[:id])
    @partner = @partnership.user == current_user ? @partnership.target : @partnership.user
    @messages = Message.where(partnership_id: params[:id]).order("id").reverse_order.page(params[:page]).per(20)
    @message = Message.new
  end

  def partner_profile
    @partnership = current_user.partnerships.find params[:id]
    @partner = @partnership.user == current_user ? @partnership.target : @partnership.user
  end
end
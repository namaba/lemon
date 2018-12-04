class Guest::PartnershipsController < Guest
  before_action :set_partnership, only: [:show, :partner]
  before_action :set_partner, only: [:show, :partner]

  def index
    @partnerships = current_user.partnerships.page(params[:page]).per(4)
    @message  = Message.new(partnership_id: @partnerships.first.id) if @partnerships.first
    @messages = Message.where(partnership_id: @partnerships.first).order("id").reverse_order.page(params[:page]).per(20) if @partnerships.first
  end

  def show
    @messages = Message.where(partnership_id: params[:id]).order("id").reverse_order.page(params[:page]).per(20)
    @message = Message.new
    gon.first_time = params[:first_time] ? true : false
  end

  def partner
  end

  private

  def set_partnership
    @partnership = current_user.partnerships.find(params[:id])
  end

  def set_partner
    @partner =
      @partnership.user == current_user ? @partnership.target : @partnership.user
  end
end
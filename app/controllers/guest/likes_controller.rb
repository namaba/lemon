class Guest::LikesController < Guest
  before_action :set_user, only: [:show, :create, :match]
  before_action :set_target, only: [:create, :match]


  def index
    @like_users = User.like_me(current_user).page(params[:page]).per(4)
    # @match_users = User.match(current_user).page(params[:page]).per(4)
    # @message = Message.new
    # @partnerships = Partnership.joins(:user).where("user_id = ? or target_id = ?", current_user, current_user)
    # @partners = []
    # @partnerships.each do |partnership|
    #   partner = partnership.user == current_user ? partnership.target : partnership.user
    #   @partners.push(partner)
    # end
    # if @messages.nil?
    #   @messages = Message.where(partnership_id: @partnerships.first)
    # end
  end

  def show
    @user = User.find(params[:id])
    render 'guest/users/preview'
  end

  def create
    raise if Like.find_by(user: @user, target: @target, like: 1)
    if @user.reduce_good
      if Like.create(user: @user, target: @target, like: 1)
        redirect_to :back, notice: "イイねしました!"
      else
        redirect_to :back, notice: "イイねできませんでした"
      end
    end
  # rescue => _error
  #   # render template: "guest/error"
  #   raise "[warning] #{_error}"
  end


  # 後々リファクタ
  def match
    ActiveRecord::Base.transaction do
      if @like = Like.find_by(user: @user, target: @target)
        @like.be_liked!
        @like.matched!
        partnership = Partnership.create(user: @user, target: @target)
        UserPartnership.create(user_id: @target.id, partnership: partnership)
        UserPartnership.create(user_id: @user.id, partnership: partnership)
        redirect_to :back
      end
    end
    rescue => _error
      render template: "guest/error"
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_target
    @target = User.find(params[:target])
  end
end

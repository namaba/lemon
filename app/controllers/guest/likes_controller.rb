class Guest::LikesController < Guest
  before_action :set_user, only: [:show, :match]
  before_action :set_target, only: [:create, :match]


  def index
    @like_users = User.like_me(current_user).page(params[:page]).per(6)
  end

  def show
  end

  def create
    redirect_to searches_path and return if current_user.like?(@target)

    @user = User.find(like_params[:user_id])
    @like = Like.new(like_params.merge({ like: 1}))
    if @like.save
      render
    else
      render json: 'no date'
    end
  end

  # 後々リファクタ
  def match
    if @like = Like.find_by(user: @user, target: @target)
      @like.be_liked!
      @like.matched!
      partnership = Partnership.create(user: @user, target: @target)
      UserPartnership.create(user_id: @target.id, partnership: partnership)
      UserPartnership.create(user_id: @user.id, partnership: partnership)
      render
    end
  end

  private
  #TODO: params[:id]はlike.idが正しいのであとでなおす
  def set_user
    @user = User.find(params[:id])
  end

  def set_target
    @target = User.find(like_params[:target_id])
  end

  def like_params
    params.require(:like).permit(:user_id, :target_id)
  end
end

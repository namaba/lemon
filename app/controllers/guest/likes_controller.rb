class Guest::LikesController < Guest
  before_action :set_user, only: [:show, :create, :match]
  before_action :set_target, only: [:create, :match]


  def index
    @like_users = User.like_me(current_user)

  end

  def show
    render 'guest/module/mypage'
  end

  def create
    if Like.create(user: @user, target: @target, like: 1)
      redirect_to :back, notice: "イイねしました!"
    else
      redirect_to :back, notice: "イイねできませんでした"
    end
    # redirect_to user_search_path(id: params[:id], user_id: params[:target])
  end



  # 後々リファクタ
  def match
    @like = Like.find_by(user: @target, target: @user)
    @like.be_liked!
    @like.matched!
    partnership = Partnership.create(user: @target, target: @user)
    UserPartnership.create(user: @target, partnership: partnership)
    UserPartnership.create(user: @user, partnership: partnership)
    redirect_to :back
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

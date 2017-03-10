class Guest::MessagesController < Guest
  before_action :set_user, only: [:show]

  def index
    @like_users = User.like_me(current_user)
  end

  def show
    render 'guest/module/mypage'
  end

  def create
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

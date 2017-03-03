class Guest::SearchesController < Guest
  before_action :set_user, only: [:show]

  def index
    # @users = User.all
    @q = UserProfile.ransack(params[:q])
    @user_profiles = @q.result.not_me(current_user).like_user(current_user)

  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

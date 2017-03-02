class Guest::SearchesController < Guest
  before_action :set_user, only: [:show]

  def index
    # @users = User.all
    @q = UserProfile.ransack(params[:q])
    @user_profiles = @q.result
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

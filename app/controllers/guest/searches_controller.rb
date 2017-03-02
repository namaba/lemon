class Guest::SearchesController < Guest


  def index
    # @users = User.all
    @q = UserProfile.ransack(params[:q])
    @user_profiles = @q.result
  end

  def show
  end
end

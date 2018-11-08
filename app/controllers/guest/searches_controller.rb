class Guest::SearchesController < Guest
  before_action :set_user, only: [:show]

  def index
    # @users = User.all
    @q = UserProfile.ransack(params[:q])
    @target_ids = @q.result.not_me(current_user).like_user(current_user).map(&:user_id)
    @users = User.where(id: @target_ids).includes(:user_profile).order("user_profiles.address DESC").page(params[:page]).per(16)
    gon.tutorial_status = current_user.user_profile.tutorial_status
    @tutorial_status = current_user.user_profile.tutorial_status
    # @user_profiles = UserProfile.page(params[:page]).per(4)
  end

  def show
    render 'guest/users/preview'
  end

  # def welcome
  #   # @users = User.all
  #   @q = UserProfile.ransack(params[:q])
  #   @user_profiles = @q.result.not_me(current_user).like_user(current_user)
  #   @users = User.where(id: @user_profiles.ids).page(params[:page]).per(16)

  #   # @user_profiles = UserProfile.page(params[:page]).per(4)
  # end


  private
  def set_user
    @user = User.find(params[:id])
  end
end

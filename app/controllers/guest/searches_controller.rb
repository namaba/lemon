class Guest::SearchesController < Guest
  before_action :set_user, only: [:show]

  def index
    @q = UserProfile.ransack(params[:q])
    @target_ids = @q.result.not_me(current_user).like_user(current_user).map(&:user_id)
    @users = params[:q].nil? ? order_sign_in_at(@target_ids) : order_answer_rate(@target_ids)
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

  def base_query(target_ids)
    User.where(id: target_ids).includes(:user_profile)
  end

  def order_sign_in_at(target_ids)
    base_query(target_ids).order("current_sign_in_at DESC").page(params[:page]).per(16)
  end

  def order_answer_rate(target_ids)
    base_query(target_ids).order("user_profiles.answer_rate DESC").page(params[:page]).per(16)
  end
end

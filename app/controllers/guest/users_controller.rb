class Guest::UsersController < Guest
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @badges = [ "l", "g", "b", "t", "s", "o" ]
    # ゲージパーセント
    @hash = @user.user_profile.attributes.compact
    @filterd_hash = @hash.except(:id, :user_id, :plan, :identification,:identification_image, :good_count, :coins_count, :mail_status, :created_at, :updated_at)
    @percent = @filterd_hash.count / 20 * 100
    @murmur = Murmur.new
    @murmurcomment = MurmurComment.new
  end

  def edit
    @user = @user.user_profile
  end

  def update
    if @user = @user.user_profile.update(profile_params)
      redirect_to :back, notice: "更新できました"
    else
      redirect_to :back, notice: "更新できませんでした"
    end
    # @user = @user_profile(profile_params)
  end

  def preview
    @user = User.find(params[:user_id])
  end

  def welcome
    # @users = User.all
    @q = UserProfile.ransack(params[:q])
    @user_profiles = @q.result.not_me(current_user).like_user(current_user)
    @users = User.where(id: @user_profiles.ids).page(params[:page]).per(16)

    # @user_profiles = UserProfile.page(params[:page]).per(4)
  end

  private
  def profile_params
    params.require(:user_profile).permit(:user_id, :sex, :play_style, :birthday, :address, :plan, :introduce, :image1, :image2, :image3, :height, :style, :job, :income, :hobby, :housemate, :alcohol, :smoke, :purpose, :marriage, :child, :identification, :identification_image, :good_count, :coins_count, :mail_status)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_profile
    @user_profile = UserProfile.find_by(user_id: params[:id])
  end
end

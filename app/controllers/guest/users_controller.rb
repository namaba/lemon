class Guest::UsersController < Guest
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @badges = [ "l", "g", "b", "t", "s", "o" ]
    # ゲージパーセント
    @hash = @user.user_profile.attributes.compact
    @filterd_hash = @hash.except(:id, :user_id, :plan, :identification,:identification_image, :good_count, :coins_count, :mail_status, :created_at, :updated_at)
    @percent = @filterd_hash.count / 20 * 100
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

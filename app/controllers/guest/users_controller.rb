class Guest::UsersController < Guest
  before_action :set_user, only: [:show, :edit, :update]
  def show
    # ゲージパーセント
    if request.referer.nil?
      flash[:error] = "不正な操作です"
      redirect_to :root
    end
    @murmur = Murmur.new
    @murmurcomment = MurmurComment.new
    gon.tutorial_status = current_user.user_profile.tutorial_status
  end

  def edit
    @user = @user.user_profile
  end

  def update
    @user.user_profile.attributes = profile_params
    fill_answer_rate
    if @user.user_profile.save
      @user.user_profile.completed! unless @user.user_profile.completed?
      redirect_to :back, success: "更新できました"
    else
      redirect_to :back, warning: "更新できませんでした"
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
    params.require(:user_profile).permit(:user_id, :sex, :play_style, :birthday, :address, :plan, :introduce, :image1, :image2, :image3, :height, :style, :job, :income, :hobby, :housemate, :alcohol, :smoke, :purpose, :marriage, :child, :personality, { :charmpoint => [] }, { :sociability => [] }, :holiday, :want_to_marriage, { :condition => [] }, :to_meet, :blood_type, :school, :bro_sis, :identification, :identification_image, :good_count, :coins_count, :mail_status)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_profile
    @user_profile = UserProfile.find_by(user_id: params[:id])
  end

  def fill_answer_rate
    profile_hash = @user.user_profile.attributes.with_indifferent_access.except(:id, :user_id, :plan, :identification,:identification_image, :answer_rate, :good_count, :coins_count, :mail_status, :identification_image, :created_at, :updated_at)
    keys_count = profile_hash.keys.count
    values_count = profile_hash.values.compact.count
    answer_rate = (values_count.to_f / keys_count.to_f * 100).floor
    @user.user_profile.attributes = {answer_rate: answer_rate}
  end
end

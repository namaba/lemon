class Guest::UsersController < Guest

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = UserProfile.find_by(user_id: params[:id])

  end

  def update
    @user = User.new(profile_params)
  end

  private
  def profile_params
    params.require(:user_profile).permit(:user_id, :sex, :play_style, :birthday, :address, :plan, :introduce, :image1, :image2, :image3, :height, :style, :job, :income, :hobby, :housemate, :alcohol, :smake, :purpose, :marriage, :child, :identification, :identification_image, :good_count, :coins_count, :mail_status)
  end

end

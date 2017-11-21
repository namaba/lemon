class Premium::UserController < Premium


  def index
    @users = UserProfile.premium
    @user = UserProfile.premium
    @partnerships = Partnership.where(user_id: @user).page(params[:page]).per(4)
    # 属性ごとにソートかけたい・・・
  end
  
  def pre_new
    @user = User.new
  end

  def pre_create
    @user = User.new(pre_params)
   if @user.save
     log_in @user
     flash[:success] = "Created Preuser"
     redirect_to "/premium"
   else
     render "pre_new"
   end
  end

  def pre_edit
    @user = User.find(params[:id])
  end

  def pre_update
    @user = User.find(params[:id])
  end

  def pre_notice
    # 新着メッセージのあるpreユーザを格納

  end

  private

  def pre_params
    params.require(:user).permit(:nickname, :sex, :birthday, :address, :plan, :introduce, :mail, :password, :password_confirmation, :image1, :image2, :image3, :height, :style, :job, :income, :hobby, :housemate, :alcohol, :smoke, :purpose, :marriage, :child, :identification, :identification_image)
  end


end
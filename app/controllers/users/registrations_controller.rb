class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    @userprofile = UserProfile.create(user_id: @user.id)
    @userprofile = UserStatus.create(user_id: @user.id)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

    # 新規登録後のリダイレクト(マイページ)
  def after_sign_up_path_for(resource)
    # pages_welcome_path
    searches_path
  end


  def after_inactive_sign_up_path_for(resource)
    admin_user_mail_sent_message_path
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # プロフィール編集後のリダイレクト(マイページ)
  def after_update_path_for(resource)
    # edit_user_registration_path
    user_path(current_user)
  end
end

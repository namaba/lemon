class RegistrationsController < Devise::RegistrationsController


  # 新規登録後のリダイレクト(マイページ)
  def after_sign_up_path_for(resource)
    # pages_welcome_path
    user_path(current_user)
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
class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    pages_welcome_path
  end

  def after_inactive_sign_up_path_for(resource)
    admin_user_mail_sent_message_path
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
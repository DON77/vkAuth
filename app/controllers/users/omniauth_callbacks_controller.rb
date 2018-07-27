class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    @user = User.from_omniauth(request.env['omniauth.auth'])
#    <%= VK::Application.new(app_id: "6642807",
#                            version: '5.80',
#                            access_token: current_user.token).getOnline(uid: current_user.uid,
#                                                                         v: '5.1') %>

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Vkontakte") if is_navigational_format?
    else
      session["devise.vkontakte_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def failure
    redirect_to root_path
  end
end


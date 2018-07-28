class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:vkontakte]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session["devise.vkontakte_data"] && session["devise.vkontakte_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    ActionController::Base.session_options[:expire_after] = 1.hour.ago 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name 
      user.image = auth.info.image
      user.token = auth.credentials.token
    end
  end
end

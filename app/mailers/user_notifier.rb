class UserNotifier < ActionMailer::Base

  LINK_TO_RESET = "[RestaurantApp] Reset your credentials"
  WAS_RESET     = "[RestaurantApp] Your password has been reset!"

  default from: "RestaurantApp <webmaster@restaurantapp.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end


  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end


end
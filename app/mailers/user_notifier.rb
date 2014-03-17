class UserNotifier < ActionMailer::Base

  default from: "RestaurantApp <webmaster@restaurantapp.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[RestaurantApp] Reset your credentials."
  end

  def password_was_reset(user)
  end

end
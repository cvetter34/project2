class SessionController < ApplicationController

  # skip_before_action :verify_authenticity_token

  def new
    # render text: current_user.inspect
    # if current_user.admin
    #   render text: "You are logged in as an admin."
    # else
      redirect_to root_url, notice: "You are logged in." if current_user
    # end
  end

  def create
    if params[:user][:password].blank?
      #password reset flow
      PasswordResetter.new(flash).handle_reset_request(user_params)
    else
      return if log_user_in( UserAuthenticator.new(session,flash).authenticate_user(user_params) )
    end
    render :new
  end

  def destroy
    log_user_out
    # render text: "Log the user out."
    # redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
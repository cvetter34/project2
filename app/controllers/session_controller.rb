class SessionController < ApplicationController

  def new
    render text: "Display the login form."
  end

  def create
    # render json: params
    # render text: "Log #{params[:user][:email]} in with #{params[:user][:email]}."
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      render text: "Logged in ^_^! #{@user.email}"
    else
      render text: "What da fuck are ye?"
    end

  end

  def destroy
    render text: "Log the user out."
  end
end
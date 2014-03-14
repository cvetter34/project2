class SessionController < ApplicationController

  def new
    # render text: "Display the login form."
  end

  def create
    # render json: params
    # render text: "Log #{params[:user][:email]} in with #{params[:user][:email]}."
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render text: "What da fuck are ye?"
    end

  end

  def destroy
    session[:user_id] = nil
    render text: "Log the user out."
  end
end
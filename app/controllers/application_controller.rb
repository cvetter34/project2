class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :make_action_mailer_user_request_host_and_protocol

  def is_authenticated?
    #check session hash for a :user_id (true/false)
    # not session[:user_id].nil?
    # redirect_to login_url if session[:user_id].nil?
    redirect_to login_url unless current_user
  end

  def is_admin?
    redirect_to login_url unless current_user and current_user.admin
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_user_in(user, notice = nil)
    if user.admin
      session[:user_id] = user.id
      redirect_to root_url, alert: "You are logged in as an admin."
    else
      session[:user_id] = user.id
      redirect_to root_url, notice: "You are logged in."
    end
  end

  def log_user_out
    session[:user_id] = nil
    redirect_to login_url, notice: "You've successfully logged out."
  end

  private

  def make_action_mailer_user_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end


end
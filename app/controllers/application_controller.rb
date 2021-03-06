class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_admin?
  helper_method :display_home_link

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def logged_in?
    !!current_user
  end

  def display_home_link
    if current_user.admin?
      "Welcome, #{view_context.link_to current_user.username, admin_ideas_path} | #{view_context.link_to "Logout", logout_path}"
    else
      "Welcome, #{view_context.link_to current_user.username, user_path(current_user)} | #{view_context.link_to "Logout", logout_path}"
    end
  end
end

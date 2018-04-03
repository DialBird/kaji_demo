# frozen_string_literal: true

module User::SessionsHelper
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:user_token])
        user_log_in user
        @current_user = user
      end
    end
  end

  def user_logged_in?
    current_user.present?
  end

  def authenticate_user?
    redirect_to user_login_path unless user_logged_in?
  end

  def user_log_in(user)
    session[:user_id] = user.id
    remember user
  end

  def user_log_out
    forget current_user
    session.delete(:user_id)
  end

  private

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:user_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:user_token)
  end
end

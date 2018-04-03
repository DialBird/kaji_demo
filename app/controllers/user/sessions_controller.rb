# frozen_string_literal: true

class User::SessionsController < User::ApplicationController
  skip_before_action :authenticate_user?

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      user_log_in user
      redirect_to user_root_path, success: t(:login, scope: 'success.messages')
    else
      flash.now[:danger] = t(:login, scope: 'errors.messages')
      render 'new'
    end
  end

  def destroy
    user_log_out
    redirect_to root_path, success: t(:logout, scope: 'success.messages')
  end
end

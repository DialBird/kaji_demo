# frozen_string_literal: true

class User::UserController < User::ApplicationController
  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_account_path, success: t(:update, scope: 'success.messages')
    else
      flash.now[:danger] = t(:update, scope: 'errors.messages')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(User::PERMITTED_ATTRIBUTES)
  end
end

# frozen_string_literal: true

class Staff::SessionsController < Staff::ApplicationController
  skip_before_action :authenticate_staff?

  def new; end

  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff&.authenticate(params[:session][:password])
      staff_log_in staff
      redirect_to staff_root_path, success: t(:login, scope: 'success.messages')
    else
      flash.now[:danger] = t(:login, scope: 'errors.messages')
      render 'new'
    end
  end

  def destroy
    staff_log_out
    redirect_to root_path, success: t(:logout, scope: 'success.messages')
  end
end

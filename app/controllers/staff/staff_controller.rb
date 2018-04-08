# frozen_string_literal: true

class Staff::StaffController < Staff::ApplicationController
  def show; end

  def edit; end

  def update
    if current_staff.update(staff_params)
      redirect_to staff_account_path, success: t(:update, scope: 'success.messages')
    else
      flash.now[:danger] = t(:update, scope: 'errors.messages')
      render :edit
    end
  end

  private

  def staff_params
    params.require(:staff).permit(Staff::PERMITTED_ATTRIBUTES)
  end
end

# frozen_string_literal: true

class Operator::SessionsController < Operator::ApplicationController
  skip_before_action :authenticate_operator?

  def new; end

  def create
    operator = Operator.find_by(email: params[:session][:email].downcase)
    if operator&.authenticate(params[:session][:password])
      operator_log_in operator
      redirect_to operator_root_path, success: t(:login, scope: 'success.messages')
    else
      flash.now[:danger] = t(:login, scope: 'errors.messages')
      render 'new'
    end
  end

  def destroy
    operator_log_out
    redirect_to root_path, success: t(:logout, scope: 'success.messages')
  end
end

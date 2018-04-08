# frozen_string_literal: true

module Operator::SessionsHelper
  def current_operator
    # rubocop:disable Style/GuardClause
    if (id = session[:operator_id])
      @current_operator ||= Operator.find_by(id: id)
    end
    # rubocop:enable Style/GuardClause
  end

  def operator_logged_in?
    current_operator.present?
  end

  def authenticate_operator?
    redirect_to operator_login_path unless operator_logged_in?
  end

  def operator_log_in(operator)
    session[:operator_id] = operator.id
  end

  def operator_log_out
    session.delete(:operator_id)
  end
end

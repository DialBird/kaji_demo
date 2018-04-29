# frozen_string_literal: true

class Operator::CleanOrdersController < Operator::ApplicationController
  before_action :setup_clean_order!, only: %i[show assign_staff].freeze

  def index
    @clean_orders = CleanOrder.all.order(created_at: :desc)
  end

  def show; end

  def assign_staff
    if @clean_order.update(staff_id: params[:staff_id])
      redirect_to operator_clean_order_path(@clean_order), success: t(:update, scope: 'success.messages')
    else
      flash[:danger] = t(:update, scope: 'errors.messages')
      render :show
    end
  end

  private

  def setup_clean_order!
    @clean_order = CleanOrder.find(params[:id]).decorate
  end
end

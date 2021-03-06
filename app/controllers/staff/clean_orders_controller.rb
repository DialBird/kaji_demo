# frozen_string_literal: true

class Staff::CleanOrdersController < Staff::ApplicationController
  before_action :setup_clean_order!, only: %i[show accept refuse complete].freeze

  def index
    @clean_orders = current_staff.clean_orders.order(created_at: :desc)
  end

  def show; end

  def accept
    @clean_order.accept!
    redirect_to staff_clean_order_path(@clean_order), success: t(:update, scope: 'success.messages')
  end

  def refuse
    @clean_order.refuse!
    redirect_to staff_root_path, success: t(:update, scope: 'success.messages')
  end

  def complete
    @clean_order.complete!
    redirect_to staff_clean_order_path(@clean_order), success: t(:update, scope: 'success.messages')
  end

  private

  def setup_clean_order!
    @clean_order = CleanOrder.find(params[:id]).decorate
  end
end

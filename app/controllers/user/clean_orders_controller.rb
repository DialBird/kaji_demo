# frozen_string_literal: true

class User::CleanOrdersController < User::ApplicationController
  before_action :setup_clean_order!, only: %i[show destroy].freeze

  def index
    @clean_orders = current_user.clean_orders.order(:created_at)
  end

  def show; end

  def new
    @clean_order = current_user.clean_orders.build(spots: [])
  end

  def create
    @clean_order = current_user.clean_orders.build(clean_order_params)
    if @clean_order.save
      redirect_to user_clean_order_path(@clean_order), success: t(:create, scope: 'success.messages')
    else
      flash[:danger] = t(:create, scope: 'errors.messages')
      render :new
    end
  end

  def destroy
    if @clean_order.update(order_status: OrderStatus::CANCELED)
      redirect_to user_clean_orders_path, success: t(:cancel, scope: 'success.messages')
    else
      flash[:danger] = t(:cancel, scope: 'errors.messages')
      render :show
    end
  end

  private

  def clean_order_params
    params.require(:clean_order).permit([*CleanOrder::PERMITTED_ATTRIBUTES, spots: []])
  end

  def setup_clean_order!
    @clean_order = CleanOrder.find(params[:id])
  end
end

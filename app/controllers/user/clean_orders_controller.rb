# frozen_string_literal: true

class User::CleanOrdersController < User::ApplicationController
  def index
    @clean_orders = current_user.clean_orders
  end

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

  private

  def clean_order_params
    params.require(:clean_order).permit([*CleanOrder::PERMITTED_ATTRIBUTES, spots: []])
  end
end

# frozen_string_literal: true

class Operator::CleanOrdersController < Operator::ApplicationController
  def index
    @clean_orders = CleanOrder.all.order(:created_at)
  end

  def show
    @clean_order = CleanOrder.find(params[:id]).decorate
  end
end

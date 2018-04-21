# frozen_string_literal: true

class Staff::CleanOrdersController < Staff::ApplicationController
  def index; end

  def show
    @clean_order = CleanOrder.find(params[:id]).decorate
  end
end

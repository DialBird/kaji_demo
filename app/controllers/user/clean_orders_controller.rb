# frozen_string_literal: true

class User::CleanOrdersController < User::ApplicationController
  def index
    @clean_orders = current_user.clean_orders
  end

  def new; end
end

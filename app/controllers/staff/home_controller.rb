# frozen_string_literal: true

class Staff::HomeController < Staff::ApplicationController
  def index
    @clean_orders = current_staff
                      .clean_orders
                      .staff_waiting
                      .order(created_at: :desc)
  end
end

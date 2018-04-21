# frozen_string_literal: true

class Staff::HomeController < Staff::ApplicationController
  def index
    @clean_orders = CleanOrder
                      .where(staff_id: current_staff.id)
                      .order(:created_at)
  end
end

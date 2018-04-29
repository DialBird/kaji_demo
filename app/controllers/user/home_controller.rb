# frozen_string_literal: true

class User::HomeController < User::ApplicationController
  def index
    @clean_orders =
      current_user.clean_orders.not_reviewed.order(date: :desc)
  end
end

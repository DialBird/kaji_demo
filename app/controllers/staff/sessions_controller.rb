# frozen_string_literal: true

class Staff::SessionsController < Staff::ApplicationController
  skip_before_action :authenticate_staff?

  def new; end

  def create; end

  def destroy; end
end

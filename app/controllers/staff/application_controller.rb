# frozen_string_literal: true

class Staff::ApplicationController < ApplicationController
  layout 'staff_layout'

  before_action :authenticate_staff?
end

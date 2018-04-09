# frozen_string_literal: true

class Operator::StaffsController < Operator::ApplicationController
  def index
    @staffs = Staff.all
  end
end

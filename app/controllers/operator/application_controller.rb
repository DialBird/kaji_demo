# frozen_string_literal: true

class Operator::ApplicationController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_USERNAME'], password: ENV['BASIC_PASSWORD']
  layout 'operator_layout'
end

# frozen_string_literal: true

class User::ApplicationController < ApplicationController
  layout 'user_layout'

  before_action :authenticate_user?
end

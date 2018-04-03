# frozen_string_literal: true

class User::ApplicationController < ApplicationController
  layout 'user_layout'
  include User::SessionsHelper

  before_action :authenticate_user?
end

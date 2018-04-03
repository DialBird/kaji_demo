# frozen_string_literal: true

class User::SessionsController < User::ApplicationController
  skip_before_action :authenticate_user?

  def new; end

  def create; end

  def destroy; end
end

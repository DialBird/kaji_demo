# frozen_string_literal: true

module AuthHelper
  def http_login
    user = ENV['BASIC_USERNAME']
    pw = ENV['BASIC_PASSWORD']
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end
end

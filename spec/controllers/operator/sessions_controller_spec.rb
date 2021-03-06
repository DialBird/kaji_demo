# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operator::SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      http_login
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end

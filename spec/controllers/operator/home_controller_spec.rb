# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operator::HomeController, type: :controller do
  before { http_login }
  let!(:operator) { FactoryBot.create(:operator) }

  describe 'GET #index' do
    context 'when operator logged in' do
      before { operator_log_in operator }

      it 'render index' do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'when operator logged out' do
      it 'redirect to login path' do
        get :index
        expect(response).to redirect_to operator_login_path
      end
    end
  end
end

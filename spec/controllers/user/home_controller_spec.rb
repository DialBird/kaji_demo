# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::HomeController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    context 'when user logged in' do
      before { user_log_in user }

      it 'render index' do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'when user logged out' do
      it 'redirect to login path' do
        get :index
        expect(response).to redirect_to user_login_path
      end
    end
  end
end

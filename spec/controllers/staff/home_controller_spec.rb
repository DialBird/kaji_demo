# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Staff::HomeController, type: :controller do
  let!(:staff) { FactoryBot.create(:staff) }

  describe 'GET #index' do
    context 'when staff logged in' do
      before { staff_log_in staff }

      it 'render index' do
        get :index
        expect(response).to render_template :index
      end
    end
    context 'when staff logged out' do
      it 'redirect to login path' do
        get :index
        expect(response).to redirect_to staff_login_path
      end
    end
  end
end

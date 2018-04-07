# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Staff::StaffController, type: :controller do
  let!(:staff) { FactoryBot.create(:staff) }

  describe 'GET #show' do
    context 'when staff logged in' do
      before { staff_log_in staff }

      it 'render show' do
        get :show
        expect(response).to render_template :show
      end
    end
    context 'when staff logged out' do
      it 'redirect to login path' do
        get :show
        expect(response).to redirect_to staff_login_path
      end
    end
  end
end

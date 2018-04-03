# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::UserController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }

  describe 'GET #show' do
    context 'when user logged in' do
      before { user_log_in user }

      it 'render show' do
        get :show
        expect(response).to render_template :show
      end
    end
    context 'when user logged out' do
      it 'redirect to login path' do
        get :show
        expect(response).to redirect_to user_login_path
      end
    end
  end
  describe 'GET #edit' do
    context 'when user logged in' do
      before { user_log_in user }

      it 'render edit' do
        get :edit
        expect(response).to render_template :edit
      end
    end
    context 'when user logged out' do
      it 'redirect to login path' do
        get :edit
        expect(response).to redirect_to user_login_path
      end
    end
  end
  describe 'PUT #update' do
    let(:user_params) do
      FactoryBot.attributes_for(:user)
    end
    context 'when user logged in' do
      before { user_log_in user }

      context 'when successed' do
        it 'redirect_to account page' do
          post :update, params: { user: user_params }
          expect(response).to redirect_to user_account_path
        end
      end
      context 'when failed' do
        it 'render edit' do
          post :update, params: { user: user_params.merge(email: nil) }
          expect(response).to render_template :edit
        end
      end
    end
    context 'when user logged out' do
      it 'render edit' do
        post :update, params: { user: user_params }
        expect(response).to redirect_to user_login_path
      end
    end
  end
end

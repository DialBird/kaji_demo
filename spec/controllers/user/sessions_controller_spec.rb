# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::SessionsController, type: :controller do
  let!(:user) { FactoryBot.create(:user, email: 'example@co.jp', pass: 'Pass1234') }

  describe 'GET #new' do
    before { get :new }
    subject { response }

    it 'returns http success' do
      is_expected.to be_success
    end
    it 'render new template' do
      is_expected.to render_template :new
    end
  end
  describe 'POST #create' do
    before do
      params = { session: { email: email, password: password } }
      post :create, params: params
    end

    context 'when valid email and password' do
      let(:email) { 'example@co.jp' }
      let(:password) { 'Pass1234' }

      it 'redirect to root' do
        expect(response).to redirect_to user_root_path
      end
      it 'session user_id exist' do
        expect(session[:user_id]).to eq user.id
      end
    end
    context 'when invalid email and password' do
      let(:email) { 'example@co.jp' }
      let(:password) { 'passpass' }

      it 'render new template' do
        expect(response).to render_template :new
      end
      it 'session user_id empty' do
        expect(session[:user_id]).to be_nil
      end
    end
  end
end

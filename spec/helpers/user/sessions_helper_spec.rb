# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User::SessionsHelper do
  let(:token) { SecureRandom.urlsafe_base64 }
  let!(:user) { FactoryBot.create(:user, remember_digest: User.digest(token)) }

  describe '#current_user' do
    subject { current_user }

    context 'when session user_id exist' do
      before { session[:user_id] = user.id }
      it 'return user' do
        is_expected.to eq user
      end
    end
    context 'when session user_id empty' do
      before do
        cookies.signed[:user_id] = user.id
        cookies[:user_token] = remember_token
      end
      let(:remember_token) { token }

      it 'set session user_id' do
        expect { subject }.to change { session[:user_id] }.from(nil).to(user.id)
      end
      describe 'remember_token status' do
        context 'when valid remember_token' do
          it 'return user' do
            is_expected.to eq user
          end
        end
        context 'when invalid remember_token' do
          let(:remember_token) { SecureRandom.urlsafe_base64 }
          it 'return nil' do
            is_expected.to be_nil
          end
        end
        context 'remember_token is empty' do
          let(:remember_token) { nil }
          it 'return nil' do
            is_expected.to be_nil
          end
        end
      end
    end
  end
  describe '#user_log_in' do
    subject { user_log_in(user) }

    describe 'session' do
      it 'set session user_id' do
        expect { subject }.to change { session[:user_id] }.from(nil).to(user.id)
      end
    end
    describe 'cookie' do
      it 'set cookie user_id' do
        expect { subject }.to change { cookies.signed[:user_id] }.from(nil).to(user.id)
      end
      it 'set cookie remember_token' do
        expect { subject }.to change { cookies[:user_token].present? }.from(false).to(true)
      end
    end
  end
  describe '#user_log_out' do
    before { user_log_in(user) }
    subject { user_log_out }

    describe 'session' do
      it 'reset session user_id' do
        expect { subject }.to change { session[:user_id] }.from(user.id).to(nil)
      end
    end
    describe 'cookie' do
      it 'reset cookie user_id' do
        expect { subject }.to change { cookies.signed[:user_id] }.from(user.id).to(nil)
      end
      it 'reset cookie remember_token' do
        expect { subject }.to change { cookies[:user_token].present? }.from(true).to(false)
      end
    end
  end
end

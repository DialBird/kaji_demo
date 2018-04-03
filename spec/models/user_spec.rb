# frozen_string_literal: true

# == Schema Information
#
# Table name: users # ユーザー
#
#  id              :integer          not null, primary key
#  gender_id       :integer          not null              # 性別(gender.yml参照)
#  age             :integer          not null              # 年齢
#  avatar          :string                                 # プロファイル画像
#  name            :string           not null              # 名前
#  birthday        :datetime                               # 誕生日
#  email           :string           not null              # メール
#  phone           :string           not null              # 電話番号
#  zip             :string                                 # 郵便番号
#  state           :string                                 # 都道府県
#  city            :string                                 # 市区町村
#  street          :string                                 # 番地
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    let(:user) { FactoryBot.build(:user) }

    shared_examples 'empty error' do |field|
      it 'error occurs when empty' do
        expect(user).to be_valid
        user.send("#{field}=", nil)
        expect(user).to be_invalid
      end
    end

    shared_examples 'invalid error' do |field, val|
      it 'error occurs when value invalid' do
        expect(user).to be_valid
        user.send("#{field}=", val)
        expect(user).to be_invalid
      end
    end

    shared_examples 'not unique error' do |field|
      let(:pre_user) { FactoryBot.build(:user) }
      it 'error occurs when value not unique' do
        expect(user).to be_valid
        pre_user.send("#{field}=", user.send(field))
        pre_user.save
        expect(user).to be_invalid
      end
    end

    shared_examples 'email format error' do |msg, val, conf_val|
      it msg do
        expect(user).to be_valid
        user.password = val
        user.password_confirmation = conf_val || val
        expect(user).to be_invalid
      end
    end

    describe '#gender_id' do
      it_behaves_like 'empty error', :gender_id
      it_behaves_like 'invalid error', :gender_id, 999
    end
    describe '#age' do
      it_behaves_like 'empty error', :age
      it_behaves_like 'invalid error', :age, 0
      it_behaves_like 'invalid error', :age, 1.1
    end
    describe '#name' do
      it_behaves_like 'empty error', :name
    end
    describe '#email' do
      it_behaves_like 'empty error', :email
      it_behaves_like 'not unique error', :email
      %w[hoge@ @co.jp hoge@com hoge].each do |pattern|
        it_behaves_like 'invalid error', :email, pattern
      end
    end
    describe '#phone' do
      it_behaves_like 'empty error', :phone
      it_behaves_like 'not unique error', :phone
      %w[00011112222 0808-1111-1111].each do |pattern|
        it_behaves_like 'invalid error', :phone, pattern
      end
    end
    describe '#zip' do
      %w[122-3333 123123].each do |pattern|
        it_behaves_like 'invalid error', :zip, pattern
      end
    end
    describe '#password' do
      it_behaves_like 'email format error', 'when password empty', nil
      it_behaves_like 'email format error', 'when password not equal to confirm', 'Abcd1234', 'Abcd2234'
      it_behaves_like 'email format error', 'when password length shorter than 8', 'Abcd123'
      it_behaves_like 'email format error', 'when password not contains number', 'Abcdasdf'
      it_behaves_like 'email format error', 'when password not contains lower case', 'ABCD1234'
      it_behaves_like 'email format error', 'when password not contains Capital', 'abcd1234'
    end
  end
end

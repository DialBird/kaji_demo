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

FactoryBot.define do
  factory :user do
    name 'MyString'
  end
end
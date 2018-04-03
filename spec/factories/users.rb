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
    gender Gender::MAN
    age 24
    sequence(:name) { |n| "#{n}Keisuke" }
    sequence(:email) { |n| "keisuke#{n}@example.com" }
    sequence(:phone) { |n| "080-1234-#{5678 - n}" }
    password 'Abcd1234'
    password_confirmation 'Abcd1234'
  end
end

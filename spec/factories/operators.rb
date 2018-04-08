# frozen_string_literal: true

# == Schema Information
#
# Table name: operators # オペレーター
#
#  id              :integer          not null, primary key
#  is_admin        :boolean          default(FALSE), not null # 管理者権限
#  name            :string           not null                 # 名前
#  email           :string           not null                 # メール
#  phone           :string           not null                 # 電話番号
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :operator do
    is_admin true
    sequence(:name) { |n| "#{n}Keisuke" }
    sequence(:email) { |n| "keisuke#{n}@example.com" }
    sequence(:phone) { |n| "080-1234-#{5678 - n}" }

    transient do
      pass 'Abcd1234'
    end

    after(:build) do |operator, evaluator|
      operator.password = evaluator.pass
      operator.password_confirmation = evaluator.pass
    end
  end
end

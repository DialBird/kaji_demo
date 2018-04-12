# frozen_string_literal: true

# == Schema Information
#
# Table name: regular_shifts # 通常時のシフト
#
#  id           :integer          not null, primary key
#  staff_id     :integer          not null                   # スタッフID
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dayofweek_id :integer          default(0), not null       # 曜日（day_of_week.yml参照）
#  start        :string           default("00:00"), not null # 開始時刻（HH:MM）
#  end          :string           default("00:00"), not null # 終了時刻（HH:MM）
#

FactoryBot.define do
  factory :regular_shift do
    mon_start 'MyString'
  end
end

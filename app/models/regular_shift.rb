# frozen_string_literal: true

# == Schema Information
#
# Table name: regular_shifts # 通常時のシフト
#
#  id         :integer          not null, primary key
#  staff_id   :integer          not null              # スタッフID
#  mon_start  :string           not null              # 月曜日開始
#  mon_end    :string           not null              # 月曜日終了
#  tue_start  :string           not null              # 火曜日開始
#  tue_end    :string           not null              # 火曜日終了
#  wed_start  :string           not null              # 水曜日開始
#  wed_end    :string           not null              # 水曜日終了
#  thu_start  :string           not null              # 木曜日開始
#  thu_end    :string           not null              # 木曜日終了
#  fri_start  :string           not null              # 金曜日開始
#  fri_end    :string           not null              # 金曜日終了
#  sat_start  :string           not null              # 土曜日開始
#  sat_end    :string           not null              # 土曜日終了
#  sun_start  :string           not null              # 日曜日開始
#  sun_end    :string           not null              # 日曜日終了
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RegularShift < ApplicationRecord
  belongs_to :staff

  DAY_OF_WEEKS = %i[sun mon tue wed thu fri sat].freeze
  PERMITTED_ATTRIBUTES =
    DAY_OF_WEEKS.map { |day| [:"#{day}_start", :"#{day}_end"] }.flatten
  TIME_REGEX = /\d{2}:\d{2}/

  DAY_OF_WEEKS.each do |day|
    validates :"#{day}_start", presence: true, format: { with: TIME_REGEX }
    validates :"#{day}_end", presence: true, format: { with: TIME_REGEX }
  end

  def shifts
    DAY_OF_WEEKS.map do |day|
      { start: send(:"#{day}_start"), end: send(:"#{day}_end") }
    end
  end
end

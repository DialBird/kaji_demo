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

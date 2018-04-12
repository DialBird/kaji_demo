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

  PERMITTED_ATTRIBUTES = %i[dayofweek_id start end].freeze
  TIME_REGEX = /\d{2}:\d{2}/

  validates :dayofweek_id, inclusion: { in: Dayofweek.all.map(&:id) }
  validates :start, presence: true, format: { with: TIME_REGEX }
  validates :end, presence: true, format: { with: TIME_REGEX }
end

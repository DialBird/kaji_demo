# frozen_string_literal: true
# == Schema Information
#
# Table name: regular_shifts # 通常時のシフト
#
#  id           :integer          not null, primary key
#  staff_id     :integer          not null              # スタッフID
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dayofweek_id :integer          default(0), not null  # 曜日（day_of_week.yml参照）
#  start_at     :integer          default(0), not null  # 開始時刻（time_block.yml参照）
#  end_at       :integer          default(0), not null  # 開始時刻（time_block.yml参照）
#

class RegularShift < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :dayofweek
  belongs_to :staff

  PERMITTED_ATTRIBUTES = %i[dayofweek_id start end].freeze
  TIME_REGEX = /\d{2}:\d{2}/

  validates :dayofweek_id, inclusion: { in: Dayofweek.all.map(&:id) },
                           uniqueness: { scope: :staff_id, message: '同じ曜日が複数個存在しています' }
  validates :start, presence: true, format: { with: TIME_REGEX }
  validates :end, presence: true, format: { with: TIME_REGEX }
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: irregular_offs # 急な休み
#
#  id         :integer          not null, primary key
#  staff_id   :integer          not null              # スタッフID
#  date       :date             not null              # 日付
#  start_at   :integer          not null              # 開始時間（time_block.yml参照）
#  end_at     :integer          not null              # 終了時間（time_block.yml参照）
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IrregularOff < ApplicationRecord
  belongs_to :staff

  PERMITTED_ATTRIBUTES = %i[staff_id date start end].freeze
  TIME_REGEX = /\d{2}:\d{2}/

  validates :date, presence: true
  validates :start, presence: true, format: { with: TIME_REGEX }
  validates :end, presence: true, format: { with: TIME_REGEX }
end

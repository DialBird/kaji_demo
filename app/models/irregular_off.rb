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

  PERMITTED_ATTRIBUTES = %i[staff_id date start_id end_id].freeze

  validates :date, presence: true
  validates :start_at, presence: true, inclusion: { in: TimeBlock.all.map(&:id) }
  validates :end_at, presence: true, inclusion: { in: TimeBlock.all.map(&:id) }
end

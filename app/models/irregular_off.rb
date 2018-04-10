# frozen_string_literal: true

# == Schema Information
#
# Table name: irregular_offs # 急な休み
#
#  id         :integer          not null, primary key
#  staff_id   :integer          not null              # スタッフID
#  date       :datetime         not null              # 日付
#  start      :string           not null              # 開始時間
#  end        :string           not null              # 終了時間
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IrregularOff < ApplicationRecord
  belongs_to :staff

  PERMITTED_ATTRIBUTES = %i[date start end].freeze
  TIME_REGEX = /\d{2}:\d{2}/

  validates :date, presence: true
  validates :start, presence: true, format: { with: TIME_REGEX }
  validates :end, presence: true, format: { with: TIME_REGEX }
end

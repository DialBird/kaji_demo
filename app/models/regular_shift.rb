# frozen_string_literal: true

# == Schema Information
#
# Table name: regular_shifts # 通常時のシフト
#
#  id           :integer          not null, primary key
#  staff_id     :integer          not null              # スタッフID
#  dayofweek_id :integer          not null              # 曜日
#  start_at     :integer          not null              # 開始時刻（time_block.yml参照）
#  end_at       :integer          not null              # 終了時刻（time_block.yml参照）
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RegularShift < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :dayofweek
  belongs_to :staff

  PERMITTED_ATTRIBUTES = %i[dayofweek_id start_at end_at].freeze

  validates :dayofweek_id, inclusion: { in: Dayofweek.all.map(&:id) },
                           uniqueness: { scope: :staff_id, message: '同じ曜日が複数個存在しています' }
  validates :start_at, presence: true, inclusion: { in: TimeBlock.all.map(&:id) }
  validates :end_at, presence: true, inclusion: { in: TimeBlock.all.map(&:id) }
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: clean_orders # 清掃オーダー
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null              # ユーザーID
#  staff_id      :integer          not null              # スタッフID
#  date          :date             not null              # 日付
#  start_at      :integer          not null              # 開始時間（time_block.yml参照）
#  end_at        :integer          not null              # 終了時間（time_block.yml参照）
#  clean_plan_id :integer          default(2), not null  # 清掃プラン（clean_plan.yml参照）
#  note          :text                                   # 備考
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CleanOrder < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :clean_plan
  has_many :clean_spots, dependent: :destroy, inverse_of: :clean_order
  accepts_nested_attributes_for :clean_spots, allow_destroy: true
end

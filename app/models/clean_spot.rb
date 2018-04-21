# frozen_string_literal: true

# == Schema Information
#
# Table name: clean_spots # 清掃箇所
#
#  id             :integer          not null, primary key
#  clean_order_id :integer          not null              # 清掃オーダーID
#  spot_id        :integer          not null              # 清掃スポットID（spot.yml参照）
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CleanSpot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  PERMITTED_ATTRIBUTES = %i[id spot_id].freeze

  belongs_to_active_hash :spot
  belongs_to :clean_order

  validates :spot_id, inclusion: { in: Spot.all.map(&:id) },
                      uniqueness: { scope: :clean_order_id, message: '同じ場所は重複して選べません' }
end

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

FactoryBot.define do
  factory :clean_spot do
    id 1
    clean_spot_id 1
  end
end

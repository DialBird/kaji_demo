# frozen_string_literal: true

# == Schema Information
#
# Table name: clean_spots # 清掃箇所
#
#  id             :integer          not null, primary key
#  clean_order_id :integer          not null              # 清掃オーダーID
#  clean_spot_id  :integer          not null              # 清掃スポットID
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe CleanSpot, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

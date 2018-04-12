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

require 'rails_helper'

RSpec.describe RegularShift, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

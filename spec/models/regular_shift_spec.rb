# frozen_string_literal: true

# == Schema Information
#
# Table name: regular_shifts # 通常時のシフト
#
#  id         :integer          not null, primary key
#  staff_id   :integer          not null              # スタッフID
#  mon_start  :string           not null              # 月曜日開始
#  mon_end    :string           not null              # 月曜日終了
#  tue_start  :string           not null              # 火曜日開始
#  tue_end    :string           not null              # 火曜日終了
#  wed_start  :string           not null              # 水曜日開始
#  wed_end    :string           not null              # 水曜日終了
#  thu_start  :string           not null              # 木曜日開始
#  thu_end    :string           not null              # 木曜日終了
#  fri_start  :string           not null              # 金曜日開始
#  fri_end    :string           not null              # 金曜日終了
#  sat_start  :string           not null              # 土曜日開始
#  sat_end    :string           not null              # 土曜日終了
#  sun_start  :string           not null              # 日曜日開始
#  sun_end    :string           not null              # 日曜日終了
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe RegularShift, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

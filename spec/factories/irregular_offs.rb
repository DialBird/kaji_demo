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

FactoryBot.define do
  factory :irregular_off do
    date '2018-04-10 10:54:33'
  end
end

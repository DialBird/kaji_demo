# frozen_string_literal: true

# == Schema Information
#
# Table name: clean_orders # 清掃オーダー
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null              # ユーザーID
#  staff_id      :integer                                # スタッフID
#  date          :date             not null              # 日付
#  start_at      :integer          not null              # 開始時間（time_block.yml参照）
#  end_at        :integer          not null              # 終了時間（time_block.yml参照）
#  clean_plan_id :integer          default(2), not null  # 清掃プラン（clean_plan.yml参照）
#  note          :text                                   # 備考
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe CleanOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

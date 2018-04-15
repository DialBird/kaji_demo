# frozen_string_literal: true

# == Schema Information
#
# Table name: irregular_offs # 急な休み
#
#  id         :integer          not null, primary key
#  staff_id   :integer          not null              # スタッフID
#  date       :date             not null              # 日付
#  start_at   :integer          not null              # 開始時間（time_block.yml参照）
#  end_at     :integer          not null              # 終了時間（time_block.yml参照）
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe IrregularOff, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

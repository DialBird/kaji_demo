# frozen_string_literal: true

# == Schema Information
#
# Table name: operators # オペレーター
#
#  id              :integer          not null, primary key
#  is_admin        :boolean          default(FALSE), not null # 管理者権限
#  name            :string           not null                 # 名前
#  email           :string           not null                 # メール
#  phone           :string           not null                 # 電話番号
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Operator, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

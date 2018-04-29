# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null              # ユーザーID
#  clean_order_id :integer          not null              # 清掃オーダーID
#  date           :date                                   # コメント日付
#  star           :integer          default(0), not null  # スター
#  comment        :text                                   # コメント
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :review do
    user_id 1
    star 1
  end
end

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

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :clean_order

  validates :star, inclusion: { in: [*0..5] }
end

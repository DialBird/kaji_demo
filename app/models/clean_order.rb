# frozen_string_literal: true

# == Schema Information
#
# Table name: clean_orders # 清掃オーダー
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null              # ユーザーID
#  staff_id        :integer                                # スタッフID
#  clean_plan_id   :integer          default(2), not null  # 清掃プラン（clean_plan.yml参照）
#  order_status_id :integer          default(1), not null  # オーダーステータス（order_status.yml参照）
#  date            :date             not null              # 日付
#  start_at        :integer          not null              # 開始時間（time_block.yml参照）
#  end_at          :integer          not null              # 終了時間（time_block.yml参照）
#  note            :text                                   # 備考
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CleanOrder < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  PERMITTED_ATTRIBUTES = %i[
    user_id staff_id clean_plan_id date start_at end_at note
  ].freeze

  attr_accessor :spots

  belongs_to_active_hash :clean_plan
  belongs_to_active_hash :order_status
  belongs_to :user
  belongs_to :staff, optional: true
  has_many :clean_spots, dependent: :destroy, inverse_of: :clean_order
  accepts_nested_attributes_for :clean_spots, allow_destroy: true

  validates :date, presence: true
  validates :start_at, inclusion: { in: ShiftTime.all.map(&:id) }
  validates :end_at, inclusion: { in: ShiftTime.all.map(&:id) }
  validates :clean_plan_id, inclusion: { in: CleanPlan.all.map(&:id) }
  validates :order_status_id, inclusion: { in: OrderStatus.all.map(&:id) }
  validate :valid_times?

  validates :spots, presence: true, on: :create

  scope :staff_waiting, -> {
    where(order_status_id: OrderStatus::CHECKING.id).where.not(staff_id: nil)
  }

  OrderStatus.all.pluck(:type).each do |status|
    define_method "#{status}?" do
      order_status == OrderStatus.find_by(type: status)
    end
  end

  def acceptable?
    checking? && !staff_id
  end

  def cancellable?
    checking? || accepted?
  end

  def staff_waiting?
    checking? && staff_id
  end

  def accept!
    update(order_status: OrderStatus::ACCEPTED) if staff_waiting?
  end

  private

  def valid_times?
    return if start_at < end_at
    errors.add(:start_at, :invalid_start_and_end)
  end
end

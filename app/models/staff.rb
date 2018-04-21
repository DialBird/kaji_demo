# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs # 家事代行スタッフ
#
#  id              :integer          not null, primary key
#  gender_id       :integer          not null              # 性別(gender.yml参照)
#  age             :integer          not null              # 年齢
#  name            :string           not null              # 名前
#  birthday        :date                                   # 誕生日
#  email           :string           not null              # メール
#  phone           :string           not null              # 電話番号
#  zip             :string                                 # 郵便番号
#  state           :string                                 # 都道府県
#  city            :string                                 # 市区町村
#  street          :string                                 # 番地
#  password_digest :string
#  remember_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Staff < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  include RememberTokenAuthentication

  PERMITTED_ATTRIBUTES = %i[
    gender_id age name birthday email phone zip state city street
    password password_confirmation
  ].freeze

  before_save { email.downcase! }

  belongs_to_active_hash :gender
  has_many :regular_shifts, dependent: :destroy, inverse_of: :staff
  accepts_nested_attributes_for :regular_shifts, allow_destroy: true
  has_many :irregular_offs, dependent: :destroy, inverse_of: :staff
  has_many :clean_orders, dependent: :destroy, inverse_of: :staff

  has_secure_password
  validates_presence_of :password_confirmation, if: :password_digest_changed?
  validates :gender_id, inclusion: { in: Gender.all.map(&:id) }
  validates :age, presence: true,
                  numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, mail_format: true, uniqueness: true
  validates :phone, presence: true, phone_format: true, uniqueness: true
  validates :zip, zip_format: true
  validates :password, password_format: true

  scope :assignable, ->(order) {
    all.select { |staff| staff.assignable?(order) }
  }

  def assignable?(order)
    in_regular_shift?(order) &&
      !any_irregular_offs?(order) &&
      !any_reserved_clean_orders?(order)
  end

  private

  def in_regular_shift?(order)
    shift = regular_shifts.find_by(dayofweek_id: order.date.wday + 1)
    shift.start_at <= order.start_at && order.end_at <= shift.end_at
  end

  def any_irregular_offs?(order)
    offs = irregular_offs.where(date: order.date)
    offs.each do |off|
      return true if schedule_overlap_with_order?(off, order)
    end
    false
  end

  def any_reserved_clean_orders?(order)
    reserved_orders = clean_orders.where(date: order.date)
    reserved_orders.each do |res_o|
      return true if schedule_overlap_with_order?(res_o, order)
    end
    false
  end

  def schedule_overlap_with_order?(schedule, order)
    order.start_at < schedule.end_at || schedule.start_at < order.end_at
  end
end

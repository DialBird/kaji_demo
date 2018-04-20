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
end

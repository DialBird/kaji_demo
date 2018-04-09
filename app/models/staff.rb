# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs # 家事代行スタッフ
#
#  id              :integer          not null, primary key
#  gender_id       :integer          not null              # 性別(gender.yml参照)
#  age             :integer          not null              # 年齢
#  name            :string           not null              # 名前
#  birthday        :datetime                               # 誕生日
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
  belongs_to_active_hash :gender

  has_secure_password
  validates_presence_of :password_confirmation, if: :password_digest_changed?
  attr_accessor :remember_token

  has_many :regular_shifts

  PERMITTED_ATTRIBUTES = %i[
    gender_id age name birthday email phone zip state city street
    password password_confirmation
  ].freeze

  before_save { email.downcase! }

  validates :gender_id, inclusion: { in: Gender.all.map(&:id) }
  validates :age, presence: true,
                  numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, mail_format: true, uniqueness: true
  validates :phone, presence: true, phone_format: true, uniqueness: true
  validates :zip, zip_format: true
  validate :valid_password_format?

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  def authenticated?(token)
    BCrypt::Password.new(remember_digest).is_password?(token)
  end

  def remember
    self.remember_token = Staff.new_token
    update(remember_digest: Staff.digest(remember_token))
  end

  def forget
    update(remember_digest: nil)
  end

  private

  def valid_password_format?
    return true if password.blank?
    return true if password =~ Settings.password_format
    errors.add(:password, :invalid_password)
    false
  end
end

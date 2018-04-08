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

class Operator < ApplicationRecord
  has_secure_password
  validates_presence_of :password_confirmation, if: :password_digest_changed?
  attr_accessor :remember_token

  PERMITTED_ATTRIBUTES = %i[
    is_admin name email phone password password_confirmation
  ].freeze

  before_save { email.downcase! }

  validates :is_admin, presence: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, mail_format: true, uniqueness: true
  validates :phone, presence: true, phone_format: true, uniqueness: true
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
    self.remember_token = Operator.new_token
    update(remember_digest: Operator.digest(remember_token))
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

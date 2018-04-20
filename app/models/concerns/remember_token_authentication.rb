# frozen_string_literal: true

module RememberTokenAuthentication
  # Includer must have remember_digest field
  attr_accessor :remember_token

  def authenticated?(token)
    BCrypt::Password.new(remember_digest).is_password?(token)
  end

  def remember
    self.remember_token = new_token
    update(remember_digest: digest(remember_token))
  end

  def forget
    update(remember_digest: nil)
  end

  private

  def new_token
    SecureRandom.urlsafe_base64
  end

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

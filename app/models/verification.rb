class Verification < ApplicationRecord
  attr_accessor :token
  before_validation :create_digest

  validates :source, presence: true, uniqueness: true
  validates :digest, :expired_at, :available_times, presence: true
  validates :available_times, numericality: { greater_than_or_equal_to: 0 }

  MAX_VERIFY_TIMES = 5
  EXPIRED_MINUTES = 15

  def self.new_token
    SecureRandom.rand(10**6)
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(token)
    BCrypt::Password.new(digest).is_password?(token)
  end

  class << self
    def generate(source)
      Verification.find_by(source: source)&.destroy

      code_attributes = {
        source: source, available_times: MAX_VERIFY_TIMES,
        expired_at: Time.current + EXPIRED_MINUTES.minutes
      }
      Verification.create!(code_attributes)
    end

    def verify(source, received_code)
      verification_code = Verification.find_by(source: source)
      return { err_code: 'not_found', message: '尚未发送验证码或者验证码已失效' } if verification_code.nil?

      verification_code.send :verify, received_code
    end

    def destroy(source)
      verification_code = Verification.find_by(source: source)
      return { err_code: 'not_found', message: '验证码不存在' } if verification_code.nil?

      verification_code.destroy
    end
  end

  protected

  def verify(received_token)
    if available_times <= 0
      { err_code: 'exceeding_retries', message: "超过最多的可尝试次数（#{MAX_VERIFY_TIMES}次），请重新发送验证码" }
    elsif Time.current > expired_at
      { err_code: 'expired', message: "距离上一次收到验证码已超过时限（#{EXPIRED_MINUTES}分钟），请重新发送验证码" }
    elsif !authenticated?(received_token)
      update!(available_times: available_times - 1)
      { err_code: 'not_matched', message: '验证码不匹配' }
    else
      false
    end
  end

  private

  def create_digest
    self.token  = Verification.new_token
    self.digest = Verification.digest(token)
  end
end

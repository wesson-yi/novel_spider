class User < ApplicationRecord
  has_secure_password

  attr_accessor :remember_token, :activation_token

  validates :mobile, presence: true, unless: ->(user) { user.email.present? }
  validates :email, presence: true, unless: ->(user) { user.mobile.present? }

  has_many :reading_records, dependent: :destroy
  has_many :books, through: :reading_records

  def unread_chapters(book)
    book.chapters.where('id > ?', reading_records.by_book(book).first.latest_chapter_id)
  end

  # 持久化会话，在数据库记住用户
  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end

  # 忘记用户
  def forget
    update(remember_digest: nil)
  end

  # 返回指定字符串的哈希摘要
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 返回一个随机令牌
  def self.new_token
    SecureRandom.urlsafe_base64
  end
end

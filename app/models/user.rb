class User < ApplicationRecord
  has_secure_password

  validates :mobile, presence: true, unless: ->(user){user.email.present?}
  validates :email, presence: true, unless: ->(user){user.mobile.present?}

  has_many :reading_records
  has_many :books, through: :reading_records
end

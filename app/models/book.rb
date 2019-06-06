class Book < ApplicationRecord
  has_many :reading_records, dependent: :destroy
  has_many :users, through: :reading_records
  has_many :chapters, dependent: :destroy
end

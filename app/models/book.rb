class Book < ApplicationRecord
  has_many :reading_records
  has_many :users, through: :reading_records
  has_many :chapters
end

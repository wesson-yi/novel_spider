class Book < ApplicationRecord
  has_many :reading_records, dependent: :destroy
  has_many :users, through: :reading_records
  has_many :chapters, dependent: :destroy

  validates :ywid, uniqueness: true, allow_blank: false
  validates :name, uniqueness: true, allow_blank: false
end

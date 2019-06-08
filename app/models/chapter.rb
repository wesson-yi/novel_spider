class Chapter < ApplicationRecord
  belongs_to :book
  has_many :reading_records, dependent: :nullify
end

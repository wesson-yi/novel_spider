class Chapter < ApplicationRecord
  belongs_to :book
  # belongs_to :reading_records, foreign_key: :id
end

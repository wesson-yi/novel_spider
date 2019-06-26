class Chapter < ApplicationRecord
  belongs_to :book
  has_many :reading_records, foreign_key: :latest_chapter_id, inverse_of: :chapter, dependent: :nullify
end

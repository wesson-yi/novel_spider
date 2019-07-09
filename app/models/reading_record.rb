class ReadingRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :chapter, foreign_key: :latest_chapter_id, optional: true, inverse_of: :reading_records

  scope :by_book, ->(book) { find_by(book_id: book.id) }

  scope :active, -> { where(deleted: false) }
  scope :inactive, -> { where(deleted: true) }
  default_scope { active }
end

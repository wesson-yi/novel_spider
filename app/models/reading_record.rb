class ReadingRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :chapter, foreign_key: :latest_chapter_id, optional: true, inverse_of: :reading_records

  scope :by_book, ->(book) { where book_id: book.id }
end

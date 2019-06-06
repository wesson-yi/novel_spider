class ReadingRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :latest_chapter, class_name: 'Chapter',
    foreign_key: :latest_chapter_id, optional: true, inverse_of: :ReadingRecord
end

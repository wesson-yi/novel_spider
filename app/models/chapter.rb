class Chapter < ApplicationRecord
  belongs_to :book
  has_many :reading_records, foreign_key: :latest_chapter_id, inverse_of: :chapter, dependent: :nullify

  after_create :notify_subscriber

  private

  def notify_subscriber
    book.users.find_each do |user|
      user.reading_records.by_book(book).update(chapter: self)
      data = { book_name: book.name, chapter_name: name }
      SendSmsJob.perform_now(to: user.mobile, template: 'books_continued', data: data, user_name: user.name)
    end
  end
end

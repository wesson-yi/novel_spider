class RemindBooksContinued
  def self.perform
    User.find_each do |user|
      books = user.books.inject([]) do |arr, book|
        unread_chapters = user.unread_chapters(book)
        next arr if unread_chapters.blank?

        user.reading_records.by_book(book).update(chapter: unread_chapters.last)
        arr << { name: book.name, latest_chapters: unread_chapters.map(&:name) }
      end

      SendSmsJob.perform_now(to: user.mobile, template: 'books_continued', books: books) if books.present?
    end
  end
end

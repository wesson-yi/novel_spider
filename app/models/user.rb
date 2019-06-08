class User < ApplicationRecord
  has_secure_password

  validates :mobile, presence: true, unless: ->(user) { user.email.present? }
  validates :email, presence: true, unless: ->(user) { user.mobile.present? }

  has_many :reading_records, dependent: :destroy
  has_many :books, through: :reading_records

  def unread_chapters(book)
    book.chapters.where('id > ?', reading_records.by_book(book).first.latest_chapter_id)
  end
end

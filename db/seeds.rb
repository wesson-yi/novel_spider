# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'wesson_yi', mobile: '15136167907', password: '0000', activated: true)
book = user.books.create!(ywid: 1979049, name: '赘婿', author_name: '愤怒的香蕉')
chapter1 = book.chapters.create!(ywid: 467391356, name: '第九三四章 天光咆哮 暗火横流（上）')
chapter2 = book.chapters.create!(ywid: 468980997, name: '第九三五章 天光咆哮 暗火横流（中）')
ReadingRecord.find_by(user: user, book: book).update!(latest_chapter: chapter1)

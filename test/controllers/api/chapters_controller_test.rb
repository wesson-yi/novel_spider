require 'test_helper'

class Api::ChapterControllerTest < ActionDispatch::IntegrationTest
  test 'the chapters be created' do
    book = books(:one)
    chapters_params = { book_ywid: book.ywid, chapters: [{ ywid: 1001, name: 'chapter1001 name' },
                                                         { ywid: 1002, name: 'chapter1002 name' }] }

    assert_difference 'Chapter.count', 2 do
      post api_chapters_url, params: chapters_params
    end
    assert_equal book.chapters.map(&:ywid).to_set, [1000, 1001, 1002].to_set
  end

  test 'the chapters not created with repeated info' do
    book = books(:one)
    chapters_params = { book_ywid: book.ywid, chapters: [{ ywid: 1000, name: 'chapter1000 name' },
                                                         { ywid: 1001, name: 'chapter1001 name' }] }

    assert_difference 'Chapter.count', 1 do
      post api_chapters_url, params: chapters_params
    end
    assert_equal book.chapters.map(&:ywid).to_set, [1000, 1001].to_set
  end
end

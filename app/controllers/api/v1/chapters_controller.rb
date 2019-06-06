class Api::V1::ChaptersController < Api::V1::BaseController
  def create
    book = Book.find_by ywid: params[:book_ywid]

    params.permit(chapters: [:ywid, :name])[:chapters].each do |chapter|
      book.chapters.create!(chapter.to_h)
    end
  end
end

class Api::V1::ChaptersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    book = Book.find_by ywid: params[:book_ywid]

    params.permit(chapters: [:ywid, :name])[:chapters].each do |chapter|
      chapter_db = book.chapters.find_or_initialize_by(ywid: chapter[:ywid])
      chapter_db.update! chapter
    end
  end
end

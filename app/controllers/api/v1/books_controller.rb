class Api::V1::BooksController < Api::V1::BaseController
  def index
    render json: Book.all.includes(:chapters)
  end
end

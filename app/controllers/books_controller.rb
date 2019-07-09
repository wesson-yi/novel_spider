class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.find_or_initialize_by(ywid: book_params['ywid'])
    @book.update!(book_params)
    ReadingRecord.find_or_create_by!(user: current_user, book: @book)

    redirect_to @current_user, notice: 'Book was successfully created.'
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.reading_records.by_book(@book).update(deleted: true)
    redirect_to books_url, notice: '删除成功！'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    # params.fetch(:book, {})
    # params.fetch(:book).permit(:name, :ywid, :author_name)
    params.require(:book).permit(:name, :ywid, :author_name)
  end
end

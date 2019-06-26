class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.includes(:chapters)
    @book  = current_user.books.build
  end
end

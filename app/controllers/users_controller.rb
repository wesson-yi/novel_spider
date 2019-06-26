class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.includes(:chapters)
  end
end

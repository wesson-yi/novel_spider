class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.includes(:chapters)
    @book  = current_user.books.build
  end

  def new
    @user = User.new
  end

  def activation_token
  end

  def create
    @user = User.new(user_params)
    verification_code = params[:activation_token]
    return unless validate_verification_code(user_params[:mobile], verification_code)

    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mobile, :activation_token, :password, :password_confirmation)
  end

  def validate_verification_code(mobile, code)
    error_message = Verification.verify(mobile, code)
    if error_message
      flash[:error] = error_message[:message]
      render 'new' and return
    end
    true
  end
end

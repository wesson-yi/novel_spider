class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mobile: params[:session][:mobile].downcase)

    if !user&.authenticate(params[:session][:password])
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    # elsif !user.activated?
    #   message = 'Account not activated. Check your email for the activation link.'
    #   flash[:warning] = message
    #   redirect_to root_url
    else
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end

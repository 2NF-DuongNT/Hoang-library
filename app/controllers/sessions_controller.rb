class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = t(".flash_login_success")
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:danger] = t(".flash_login_error")
      render :new
    end
  end

  def destroy
    if log_out
      flash[:success] = t(".flash_logout_success")
    end
    redirect_to root_path 
  end
end

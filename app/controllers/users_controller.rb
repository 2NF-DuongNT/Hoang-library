class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :find_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t(".flash_success")
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t(".flash_update_success")
      redirect_to @user
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :age, :gender, :email,
             :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by id: params[:id]
      if @user.nil?
        flash[:danger] = t("users.flash_find_error")
        redirect_to root_path
      end
    end

end

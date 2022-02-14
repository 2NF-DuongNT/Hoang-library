class ClientsController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :find_client, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @client = Client.new
  end

  def create
    @client = Client.new client_params
    if @client.save
      log_in @client
      flash[:success] = t("users.create.flash_success")
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @client.update client_params
      flash[:success] = t("users.update.flash_update_success")
      redirect_to @client
    else 
      render :edit
    end
  end

  

  private

    def client_params
      params.require(:client).permit(:name, :age, :gender, :email,
            :password, :password_confirmation)
    end

    def find_client
      @client = Client.find_by id: params[:id]
      if @client.nil?
        flash[:danger] = t("users.flash_find_error")
        redirect_to root_path
      end
    end

    def correct_user
      redirect_to root_url unless @client.current_user?(current_user)
    end

end


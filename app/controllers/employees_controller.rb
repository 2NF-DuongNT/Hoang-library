class EmployeesController < ApplicationController
    before_action :logged_in_user, except: [:new, :create]
    before_action :find_employee, only: [:edit, :update]

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new employee_params
        if @employee.save
            log_in @employee
            flash[:success] = t("users.create.flash_success")
            redirect_to root_path
        else
            render :new
        end
    end

    def update
        if @employee.update employee_params
            flash[:success] = t("users.update.flash_update_success")
            redirect_to @employee
        else
            render :edit
        end
    end

    private

        def employee_params
        params.require(:employee).permit(:name, :age, :gender, :email,
                :password, :password_confirmation)
        end

        def find_employee
            @employee = Employee.find_by id: params[:id]
            if @employee.nil?
              flash.now[:danger] = t(".flash_find_error")
              render :new
            end
        end
        
end


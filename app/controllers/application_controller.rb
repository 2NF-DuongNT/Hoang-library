class ApplicationController < ActionController::Base
    include SessionsHelper
    
    before_action :set_locale

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end
     
    def default_url_options
        {locale: I18n.locale}
    end

    def logged_in_user
        unless logged_in?
            flash[:danger] = t("flash_login")
            redirect_to login_path
        end
    end

    private

        def require_employee
            unless current_user.Employee?
                flash[:danger] = t("employees.flash_not_employee")
                redirect_to root_path
            end
        end

end

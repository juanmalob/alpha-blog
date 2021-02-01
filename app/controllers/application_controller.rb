class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #hace que el metodo se accesible por las vistas aparte de las controllers.
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user #esto convierte current_user en un booleano
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform than action"
            redirect_to login_path
        end
    end
end

class SessionsController < ApplicationController
    def new
    end


    def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id #esto crea una sesion para el usuario
            #railsguides Controller ActionController Overview sessions. Se almacenan los datos de usuario en una cookie. Esta encriptada.
            flash[:notice] = "Logged successfully"
            redirect_to user
       else
            flash.now[:alert] = "There was something wrong with your login details"
            render 'new'
       end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
    
end
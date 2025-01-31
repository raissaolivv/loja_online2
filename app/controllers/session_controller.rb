class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user.admin? ? admin_dashboard_path : homepage_path
      else
        flash[:alert] = "Credenciais inválidas! Por favor, tente novamente."
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to login_path, notice: "Você saiu com sucesso."
    end
end
  
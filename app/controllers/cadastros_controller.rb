class CadastrosController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save  
          flash[:notice] = "Cadastro realizado com sucesso! Faça login para acessar sua conta."
          redirect_to login_path
      else
          @user.destroy
          render :new
        end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:nome, :endereco, :telefone, :dataNasc, :email, :password, :password_confirmation)
    end
  
end
  
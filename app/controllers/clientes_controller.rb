class ClientesController < ApplicationController
    def new
      @cliente = Cliente.new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save
        @cliente = Cliente.new(cliente_params.merge(user: @user))
  
        if @cliente.save
          flash[:notice] = "Cadastro realizado com sucesso! Faça login para acessar sua conta."
          redirect_to login_path
        else
          @user.destroy
          render :new
        end
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def cliente_params
      params.require(:cliente).permit(:nome, :endereco, :telefone, :dataNasc)
    end
end
  
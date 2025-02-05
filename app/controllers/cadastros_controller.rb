class CadastrosController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      if @user.save
        session[:user_id] = @user.id
        redirect_to home_path, notice: "Cadastro realizado com sucesso!"
      else
        flash[:alert] = "Erro ao cadastrar usuário"
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:nome, :endereco, :telefone, :data_nasc, :email, :password, :password_confirmation)
    end
  
end
  
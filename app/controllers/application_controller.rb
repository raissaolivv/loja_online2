class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Devise já cuida da autenticação

  # Permitir acessar current_user e verificar se está logado
  helper_method :current_user, :logged_in?

  # Métodos de autenticação não são necessários com Devise
  def logged_in?
    user_signed_in?
  end
end

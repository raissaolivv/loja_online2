class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :devise_controller? # Devise já cuida da autenticação

  # Permitir acessar current_user e verificar se está logado
  helper_method :current_user, :logged_in?

  # Métodos de autenticação não são necessários com Devise
  def logged_in?
    user_signed_in?
  end

  def after_sign_out_path_for(resource_or_scope)
    login_path  # Redireciona para sua página de login personalizada
  end

  def after_sign_in_path_for(resource)
    root_path  # Redireciona para a home após login
  end
end

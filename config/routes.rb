Rails.application.routes.draw do
  # Página inicial
  root "home#index"

  # Devise cuida da autenticação (login, logout, cadastro, recuperação de senha)
  devise_for :users, skip: [:sessions]

  devise_scope :user do
    get "login", to: "devise/sessions#new"   # Sua tela personalizada
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy"
  end
  

  # Cadastro de novos usuários (Se quiser uma tela personalizada para cadastro)
  get "cadastro", to: "devise/registrations#new"

  # Produtos
  resources :produtos, only: [:index]

  # Carrinho
  resource :carrinhos, only: [:show] do
    post "adicionar/:id", to: "carrinhos#adicionar", as: "adicionar"
    delete "remover/:id", to: "carrinhos#remover", as: "remover"
    patch "aumentar/:id", to: "carrinhos#aumentar_quantidade", as: "aumentar"
    patch "diminuir/:id", to: "carrinhos#diminuir_quantidade", as: "diminuir"
  end

  # Pedidos
  get "finalizar", to: "pedidos#finalizar"
  post "finalizar", to: "pedidos#finalizar"
end

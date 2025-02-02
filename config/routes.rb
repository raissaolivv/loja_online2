Rails.application.routes.draw do
  devise_for :users
  root "sessions#new"

  # Sessões (login/logout)
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Clientes (cadastro)
  get "cadastro", to: "cadastros#new"
  post "cadastro", to: "cadastros#create"

  #Homepage
  post "home", to: "home#index"

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

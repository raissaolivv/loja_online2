Rails.application.routes.draw do
  root "produtos#index"

  # Sessões (login/logout)
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # Clientes (cadastro)
  get "cadastro", to: "clientes#new"
  post "cadastro", to: "clientes#create"

  # Produtos
  resources :produtos, only: [:index]

  # Carrinho
  resource :carrinho, only: [:show] do
    post "adicionar/:codigo", to: "carrinhos#adicionar", as: "adicionar"
    delete "remover/:id", to: "carrinhos#remover", as: "remover"
    patch "aumentar/:id", to: "carrinhos#aumentar_quantidade", as: "aumentar"
    patch "diminuir/:id", to: "carrinhos#diminuir_quantidade", as: "diminuir"
  end

  # Pedidos
  get "finalizar", to: "pedidos#finalizar"
  post "finalizar", to: "pedidos#finalizar"
end

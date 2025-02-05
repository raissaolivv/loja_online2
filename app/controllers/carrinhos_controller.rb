class CarrinhosController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @carrinho = current_user.carrinho || Carrinho.create(user: current_user)
      @itens = @carrinho.produto_carrinhos
      @total_geral = @itens.sum { |item| item.produto.preco * item.quantidade }
      
    end
  
    def adicionar
      @produto = Produto.find_by(id: params[:id])
      @carrinho = current_user.carrinho || Carrinho.create(user: current_user)
  
      item = @carrinho.produto_carrinhos.find_or_initialize_by(produto: @produto)
      item.quantidade = (item.quantidade || 0) + 1
      item.save
  
      redirect_to carrinhos_path
    end
  
    def remover
      item = ProdutoCarrinho.find_by(produto_id: params[:id], carrinho_id: current_user.carrinho.id)
      item.destroy if item
      redirect_to carrinhos_path
    end
  
    def aumentar_quantidade
      item = ProdutoCarrinho.find_by(produto_id: params[:id], carrinho_id: current_user.carrinho.id)
      item.update(quantidade: item.quantidade + 1) if item
      redirect_to carrinhos_path
    end
  
    def diminuir_quantidade
      item = ProdutoCarrinho.find_by(produto_id: params[:id], carrinho_id: current_user.carrinho.id)
      
      if item && item.quantidade > 1
        item.update(quantidade: item.quantidade - 1)
      else
        item.destroy
      end
  
      redirect_to carrinhos_path
    end
end
  
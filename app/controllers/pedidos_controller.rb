class PedidosController < ApplicationController
    before_action :authenticate_user!
  
    def finalizar
      cliente = current_user.cliente
      carrinho = cliente.carrinho
      itens = carrinho.produto_carrinhos
      total_geral = itens.sum { |item| item.produto.preco * item.quantidade }
  
      if request.post?
        pedido = Pedido.create(cliente: cliente, valor: total_geral, status: "Pendente")
  
        itens.each do |item|
          PedidoProduto.create(pedido: pedido, produto: item.produto, quantidade: item.quantidade)
        end
  
        Pagamento.create(pedido: pedido, metodo: params[:metodo_pagamento])
  
        carrinho.produto_carrinhos.destroy_all  # Esvaziar carrinho
        redirect_to homepage_path, notice: "Compra finalizada com sucesso!"
      else
        @itens = itens
        @total_geral = total_geral
      end
    end
end
  
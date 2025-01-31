class PedidoProduto < ApplicationRecord
    belongs_to :pedido
    belongs_to :produto
  
    validates :quantidade, numericality: { greater_than: 0 }
end
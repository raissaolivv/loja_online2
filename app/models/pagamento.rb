class Pagamento < ApplicationRecord
    belongs_to :pedido
  
    enum metodo: { cartao: 'Cartão', boleto: 'Boleto', pix: 'Pix' }
  
    def to_s
      pedido.id.to_s
    end
end
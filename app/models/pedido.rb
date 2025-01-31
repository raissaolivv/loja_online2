class Pedido < ApplicationRecord
    belongs_to :cliente
    has_many :pedido_produtos
    has_many :produtos, through: :pedido_produtos
    has_one :pagamento
    has_many :avaliacoes
  
    enum status: { pendente: 'Pendente', pago: 'Pago', enviado: 'Enviado', entregue: 'Entregue' }
  
    validates :valor, numericality: { greater_than_or_equal_to: 0 }
  
    def to_s
      id.to_s
    end
end
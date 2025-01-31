class Carrinho < ApplicationRecord
    belongs_to :cliente
    has_many :produto_carrinhos
    has_many :produtos, through: :produto_carrinhos
  
    def to_s
      cliente.nome
    end
end
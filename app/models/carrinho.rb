class Carrinho < ApplicationRecord
    belongs_to :user
    has_many :produto_carrinhos
    has_many :produtos, through: :produto_carrinhos
  
    def to_s
      user.nome
    end
end
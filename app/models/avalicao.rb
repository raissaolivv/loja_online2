class Avaliacao < ApplicationRecord
    belongs_to :autor, class_name: 'Cliente'
    belongs_to :pedido
  
    validates :estrelas, inclusion: { in: 1..5 }
  
    def to_s
      autor.nome
    end
end
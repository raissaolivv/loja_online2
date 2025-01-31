class Estoque < ApplicationRecord
    belongs_to :produto
  
    validates :quantidade, numericality: { greater_than_or_equal_to: 0 }
end
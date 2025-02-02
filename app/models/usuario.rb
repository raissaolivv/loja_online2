class Cliente < ApplicationRecord
    belongs_to :user, optional: true
    has_many :pedidos
    has_many :avaliacoes
    has_many :carrinhos
  
    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true
    validates :telefone, presence: true
  
    def to_s
      nome
    end
end
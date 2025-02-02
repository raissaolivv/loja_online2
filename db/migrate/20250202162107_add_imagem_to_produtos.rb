class AddImagemToProdutos < ActiveRecord::Migration[8.0]
  def change
    add_column :produtos, :imagem, :string
  end
end

class CreateProdutoCarrinho < ActiveRecord::Migration[8.0]
  def change
    create_table :produto_carrinhos do |t|
      t.references :carrinho, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade, default: 0

      t.timestamps
    end
  end
end

class CreateProdutos < ActiveRecord::Migration[8.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.integer :estoque
      t.string :codigo

      t.timestamps
    end
  end
end

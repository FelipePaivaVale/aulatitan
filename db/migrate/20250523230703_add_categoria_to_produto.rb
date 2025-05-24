class AddCategoriaToProduto < ActiveRecord::Migration[8.0]
  def change
    add_columns :produtos, :categoria,type: :string
  end
end

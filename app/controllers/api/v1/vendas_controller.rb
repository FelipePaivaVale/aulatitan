class Api::V1::VendasController < ApplicationController
    def create
        @produto = Produto.find(params[:produto_id])
        @venda = Venda.new(venda_params)
        @venda.valor_total = @produto.preco * @venda.quantidade

        if @venda.save
            @produto.estoque -= @venda.quantidade
            @produto.save
            render json: @venda, status: :created
        else
            render json: { errors: @venda.errors }, status: :unprocessable_entity
        end
    end

    def index 
        @vendas = Venda.all
        render json: @vendas, status: :ok
    end 
    private 

    def venda_params
        params.require(:venda).permit(:quantidade, :produto_id)
    end 
end

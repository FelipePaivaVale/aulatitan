class Api::V1::ProdutosController < ApplicationController
    before_action :set_produto, only: [:show, :update, :destroy]
    
    def index 
        @produtos = Produto.all
        render json: @produtos, status: :ok
    end

    def show 
        render json: @produto, status: :ok
    end

    def create
        @produto = Produto.new(produto_params)
        if @produto.save
            render json: @produto, status: :created
        else
            render json: { errors: @produto.errors }, status: :unprocessable_entity
        end
    end 

    def destroy
        if @produto.destroy
            render json: { message: 'Produto deletado com sucesso' }, status: :ok
        else
            render json: { errors: @produto.errors }, status: :unprocessable_entity
        end
    end 

    def update 
        if @produto.update(produto_params)
            render json: @produto, status: :ok
        else
            render json: { errors: @produto.errors }, status: :unprocessable_entity
        end
    end

    private 

    def set_produto 
        @produto = Produto.find(params[:id])
    end

    def produto_params
        params.require(:produto).permit(:nome, :preco, :estoque, :codigo, :categoria)
    end
end

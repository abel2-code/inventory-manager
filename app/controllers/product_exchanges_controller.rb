class ProductExchangesController < ApplicationController

    before_action :find_product_exchange, only: [:show, :edit, :update, :destroy]

    def index
        @product_exchanges = ProductExchange.all
    end

    def show
    end

    def new
        @product_exchange = ProductExchange.new
    end

    def create
        
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def product_exchange_params
        params.require(:product_exchange).permit(
            :musician_id, :product_id, :exchange_type, :refundable?, :total_number_scheduled
        )
    end

    def find_product_exchange
        @product_exchange = ProductExchange.find(params[:id])
    end

end

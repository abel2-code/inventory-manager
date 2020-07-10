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
        @product_exchange = ProductExchange.new(product_exchange_params)

        if @product_exchange.valid? && @product_exchange.check_for_adequate_funds
            @product_exchange.process_product_exchange
            @product_exchange.save

            redirect_to @product_exchange
        else
            if !@product_exchange.check_for_adequate_funds
                @product_exchange.errors.messages[:inadequate_funds] << ""
            end
            render "new"
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @product_exchange.refund
        @product_exchange.save
        @product_exchange.destroy
        redirect_to gc_branches_path
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

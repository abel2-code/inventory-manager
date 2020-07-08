class RepairShopsController < ApplicationController

    before_action :find_repair_shop, only: [:show, :edit, :update, :destroy]

    def index
        @repair_shops = RepairShop.all
    end

    def show
    end

    def new
        @repair_shop = RepairShop.new
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

    def repair_shop_params
        params.require(:repair_shop).permit(
            :name, :city, :capacity
        )
    end

    def find_repair_shop
        @repair_shop = RepairShop.find(params[:id])
    end

end

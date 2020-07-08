class ProductsController < ApplicationController

    before_action :find_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
        @gc_branches = GcBranch.all
    end

    def show
    end

    # def new
    #     @product = Product.new
    # end

    # def create
    # end

    # def edit
    # end

    # def update
    # end

    # def destroy
    # end

    # private

    # def product_params
    #     params.require(:product).permit(
    #         :product_type, :gc_branch_id, :brand, :serial, :purchase_cost, :available?, :rentable?, :rate_for_rental
    #     )
    # end

    def find_product
        @product = Product.find(params[:id])
    end

end

class RepairRequestsController < ApplicationController

    before_action :find_repair_request, only: [:show, :edit, :update, :destroy]

    def index
        @repair_requests = RepairRequest.all
    end

    def show
    end

    def new
        @repair_request = RepairRequest.new
    end

    def create
        @repair_request = RepairRequest.new(repair_request_params)

        if @repair_request.valid?
            @repair_request.save
            redirect_to repair_request_path(@repair_request)
        else
            render "new"
        end

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def repair_request_params
        params.require(:repair_request).permit(
            :product_id, :repair_shop_id
        )
    end

    def find_repair_request
        @repair_request = RepairRequest.find(params[:id])
    end

end

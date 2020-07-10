class MusiciansController < ApplicationController

    before_action :find_musician, only: [:show, :edit, :update, :destroy]

    def index
        @musicians = Musician.all
    end

    def show
    end

    def new
        @musician = Musician.new
    end

    def create
        @musician = Musician.new(musician_params)
        
        if @musician.valid?
            @musician.save
            redirect_to new_product_exchange_path
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

    def musician_params
        params.require(:musician).permit(
            :name, :is_a_student?, :bank_account
        )
    end

    def find_musician
        @musician = Musician.find(params[:id])
    end

end

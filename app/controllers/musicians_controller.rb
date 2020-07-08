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
            :name, :bank_account, :is_a_student?
        )
    end

    def find_musician
        @musician = Musician.find(params[:id])
    end

end

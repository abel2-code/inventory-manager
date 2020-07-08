class GcBranchesController < ApplicationController

    before_action :find_gc_branch, only: [:show, :edit, :update, :destroy]

    def index
        @gc_branches = GcBranch.all
    end

    def show
    end

    # def new
    #     @gc_branch = GcBranch.new
    # end

    # def create
    # end

    # def edit
    # end

    # def update
    # end

    # def destroy
    # end

    private

    # def gc_branch_params
    #     params.require(:gc_branch).permit(
    #         :city, :company_bank_acct
    #     )
    # end

    def find_gc_branch
        @gc_branch = GcBranch.find(params[:id])
    end

end

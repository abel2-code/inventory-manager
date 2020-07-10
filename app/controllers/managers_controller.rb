class ManagersController < ApplicationController

    def new
        @manager = Manager.new
    end

    def create
        @manager = Manager.new(manager_params)

        session[:gc_branch_id] = @manager.gc_branch.id

        if @manager.valid?
            @manager.save
            redirect_to gc_branch_path(@manager.gc_branch)
        else
            render "new"
        end

    end

    private

    def manager_params
        params.require(:manager).permit(:username, :password, :gc_branch_id)
    end

end

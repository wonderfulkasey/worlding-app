class PlotsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plot, except: [:index, :new, :create]

    def index
    end

    def show
    end

    def new
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

    def world_params
        params.require(:world).permit(
            :title
            :importance
            :description
            :world_id
        )
    end
end

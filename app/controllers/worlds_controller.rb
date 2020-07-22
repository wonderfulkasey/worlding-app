class WorldsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_world, except: [:index, :new, :create, :show]

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
            :name
            :genre
            :description
            :aesthetic
        )
    end

end

class WorldsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_world, except: [:index, :new, :create, :show]

    def index
        @worlds = World.all
    end

    def show
        if params[:id] == "most-characters"
            @world = World.most_characters.first
        else
            set_world
        end
        @characters = @world.characters.reverse
    end

    def character
        @character = Character.find(params[:hike_id])
        render template: 'characters/show'
    end

    def plot
        @plot = Plot.find(params[:plot_id])
        render template: 'plots/show'
    end

    def new
        @world = World.new
    end

    def create
        @world = World.new(world_params)
        @world.user_id = current_user.id

        if @world.valid?
            @world.save
            redirect_to world_path(@world)
        else
            flash[:errors] = @world.errors.full_messages
            render :new
        end 
    end

    def edit
    end

    def update
        @world.update(world_params)

        if @world.save
            redirect_to @world
        else
            flash[:errors] = @world.errors.full_messages
            render :edit
        end
    end

    def destroy
        @world.destroy
        redirect_to worlds_path
    end

    private 

    def world_params
        params.require(:world).permit(
            :name,
            :genre,
            :description,
            :aesthetic
        )
    end

end

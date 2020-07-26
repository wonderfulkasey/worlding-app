class CharactersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_character, except: [:index, :new, :create, :show, :destroy]

    def index
        if @world.user_id = current_user
            @world = World.find_by(id:params[:world_id])
            @characters = @world.characters.all
        else
            flash[:alert] = "not your page"
            redirect_to worlds_path
        end
    end

    def show
       # @character = Character.find(params[:id])
        @world = @character.world
    end

    def new
        if params[:world_id] && !World.exists?(params[:world_id])
            redirect_to worlds_path, alert: "world not found."
          else
            @character = Character.new(world_id: params[:world_id])
          end
    end

    def create
        @character = Character.new(character_params)
        #@character = current_user.characters.build(character_params)
        @character.user_id = current_user.id

          if @character.valid?
            @character.save
            redirect_to character_path(@character)
          else
            flash[:errors] = @character.errors.full_messages
            render :new
        end
    end

    def edit
       @character = Character.find(params[:id])
    end

    def update
        #@character.update(character_params)
        @character = Character.find(params[:id])
        
        if @character.update(character_params)
            redirect_to character_path(@character)
        else
            flash[:errors] = @character.errors.full_messages
            render :edit
        end
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy

        redirect_to characters_path 
    end

    private 

    def character_params
        params.require(:character).permit(
            :name,
            :alignment,
            :species,
            :character_class,
            :description,
            :user_id,
            :world_id
        )
    end

    def set_world
        @world = World.find_by(id:params[:world_id])
    end

end
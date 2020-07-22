class PlotsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plot, except: [:index, :new, :create]

    def index
        @plots = Plot.all
    end

    def show
        #@plot = plot.find(params[:id])
        @world = @plot.world
    end

    def new
        if params[:world_id] && !World.exists?(params[:world_id])
            redirect_to worlds_path, alert: "World not found."
        else
             @plot = Plot.new(world_id: params[:world_id])
        end
    end

    def create
        @plot = Plot.new(plot_params)
        @plot.user_id = current_user.id
          
          if @plot.valid?
              @plot.save
              redirect_to plot_path(@plot)
          else
            flash[:errors] = @plot.errors.full_messages
            render :new
          end
    end

    def edit
        if params[:world_id]
            w = World.find_by(id: params[:world_id])
            if w.nil?
              redirect_to worlds_path, alert: "World not found."
            else
              @plot = w.plots.find_by(id: params[:id])
              redirect_to world_plots_path(w), alert: "Plot not found." if @plot.nil?
            end
        end
    end

    def update
        @plot.update(plot_params)
        
        if @plot.save  
            redirect_to @plot
        else
            flash[:errors] = @plot.errors.full_messages
            render :edit
        end
    end

    def destroy
        @plot.destroy
        redirect_to plots_path 
    end

    private 

    def plot_params
        params.require(:plot).permit(
            :title
            :importance
            :description
            :world_id
        )
    end
end

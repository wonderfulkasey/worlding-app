class WorldsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_world, except: [:index, :new, :create, :show]


end

class PlotsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plot, except: [:index, :new, :create]


end

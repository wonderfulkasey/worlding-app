class CharactersController < ApplicationController
end
class CharactersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_character, except: [:index, :new, :create]

end
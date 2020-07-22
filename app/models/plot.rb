class Plot < ApplicationRecord
    belongs_to :world
    belongs_to :user

    validates :title, presence: true
end

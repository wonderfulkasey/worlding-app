class World < ApplicationRecord
    belongs_to :user
        #when delete world, deletes chars and plots
    has_many :characters, :dependent => :destroy
    has_many :plots, :dependent => :destroy

    validates :name, presence: true
    #validates :genre, presence: true 

    #where you world by character count
    def self.most_characters(user)
        where(completed: true, user_id: user.id).count
    end

end

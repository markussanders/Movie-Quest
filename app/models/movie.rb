class Movie < ActiveRecord::Base
    has_many :queue_selections
    has_many :users, through: :queue_selection
    
    
end

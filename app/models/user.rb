class User < ActiveRecord::Base
    has_many :queue_selections
    has_many :movies, through: :queue_selection
end
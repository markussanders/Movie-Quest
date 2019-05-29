class Actor < ActiveRecord::Base
    has_many :stars
    has_many :movies, through: :stars

end

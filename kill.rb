class Kill < ApplicationRecord
    belongs_to :bestiary
    validates :date, :latitude, :longitude, presence: true 
end

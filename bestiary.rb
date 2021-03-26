class Bestiary < ApplicationRecord
    has_many :kills
    validates :name, :weakness, :location, :kingdom, presence: true 
    validates :name, :weakness, :location, :kingdom, uniqueness: true 
    validate :validate_uniqueness
    def validate_uniqueness
        if name == weakness
            errors.add(:name, "weakness must be different")   
        end
    end
end

class Student < ApplicationRecord 
    validates :name, presence: true 
    validates :age, numericality: true, exclusion: {within: 0..18}
    belongs_to :instructor
end

class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, numericality: {equal_to: 10} 


end

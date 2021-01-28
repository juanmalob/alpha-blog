class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { minumum: 6, maximum: 100 } #obliga a poner titulo, y a una longitud minima y maxima 
    validates :description, presence: true, length: {minimum: 10, maximum: 300 }
end

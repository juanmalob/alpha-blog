class Article < ApplicationRecord
    validates :title, presence: true, length: { minumum: 6, maximum: 100 } #obliga a poner titulo, y a una longitud minima y maxima 
    validates :description, presence: true, length: {minimum: 10, maximum: 300 }
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
end

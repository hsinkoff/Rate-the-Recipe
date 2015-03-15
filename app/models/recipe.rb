class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :suggestions
	
	validates :name, length: {minimum:2, maximum:25}
	validates :ingredients, :presence => true
	validates :directions, :presence => true
end

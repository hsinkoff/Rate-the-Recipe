class RecipesController < ApplicationController
	has_many :suggestions
	belongs_to :user

end

class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		@recipe.recipe_date
		if @recipe.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def index
		@recipes = Recipe.where('publish_date <= ?', Time.now).reorder(:publish_date).last
	end
	
	def edit
		@recipes = Recipe.find(params[:id])
	end

	def update
		@recipes = Recipe.find(params[:id])
		@recipes.update_attributes(recipe_params)
		redirect_to recipes_path
	end

	def show
		@recipes = Recipe.find(params[:id])
		@suggestion  = Suggestion.new
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients, :directions, :meal)
	end
end

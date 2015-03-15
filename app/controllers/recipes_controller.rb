class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		if @recipe.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def index
		@recipes = Recipe.order(:name).first
		@suggestion=Suggestion.new
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
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients, :directions)
	end
end

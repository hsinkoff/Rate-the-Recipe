class RecipesController < ApplicationController

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		#check syntax
		last_recipe = Recipe.reorder(:date).last
		if last_recipe == nil 
			@recipe.date = Time.now
		else
			@recipe.date = last_recipe.date + 7.days
		end
		if @recipe.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def index(t_id=1)
		@recipes.where("date <= #{Time.now}").reorder(:date).last
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
		@suggestion=Suggestion.new
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients, :directions, :meal)
	end
end

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

	def index(t_id=1)
		t = Time.now
		if t.thursday? && !Recipe.exists?(t_id+1)
			t_id = 1
		elsif t.thursday?
			t_id = t_id + 1
		end
		@recipes=Recipe.find(t_id)
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

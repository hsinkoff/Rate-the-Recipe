class SuggestionsController < ApplicationController
	def create
		@recipes=Recipe.find(params[:recipe_id])
		@suggestion=@recipes.suggestions.create(suggestion_params)
		redirect_to recipe_path(@recipes)
	end

	private

	def suggestion_params
		params.require(:suggestion).permit(:suggestion, :recipe_id)
	end
end

class SuggestionsController < ApplicationController
	def create
		@recipes=Recipe.find(params[:recipe_id])
		@suggestion=Suggestion.create(suggestion_params)
		redirect_to recipes_path
	end

	private

	def suggestion_params
		params.require(:suggestion).permit(:suggestion)
	end
end

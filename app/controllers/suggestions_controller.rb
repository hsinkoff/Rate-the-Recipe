class SuggestionsController < ApplicationController
	before_action :authenticate_user!

	def create
		@recipes=Recipe.find(params[:recipe_id])
		@suggestion=@recipes.suggestions.create(suggestion_params)
		current_user.update_attributes(usage: 1 + current_user.usage)
		redirect_to recipe_path(@recipes)
	end

	private

	def suggestion_params
		params.require(:suggestion).permit(:suggestion, :recipe_id)
	end
end

class StaticPagesController < ApplicationController
	def index
		@recipes=Recipe.order(:name).first
	end

	def about
	end

	def archive
		@recipes=Recipe.order(:name)
	end
end

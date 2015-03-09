class UsersController < ApplicationController
	has_many :suggestions
	has_many :recipes
end

class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def show
		if current_user.premium || current_user.admin?
			true
		else
			redirect_to root_path
		end
	end
end
class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :suggestions
	
	validates :name, length: {minimum:2, maximum:25}
	validates :ingredients, :presence => true
	validates :directions, :presence => true

	def recipe_date
		#publish_date isn't currently updating
		last_recipe = Recipe.reorder(:publish_date).last
		if last_recipe.publish_date == nil
			self.publish_date = Time.now
			self.save
		else
			self.publish_date = last_recipe.publish_date + 7.days
			self.save
		end
	end

end

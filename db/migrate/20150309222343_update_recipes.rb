class UpdateRecipes < ActiveRecord::Migration
  def change
  	remove_column :recipes, :recipe_id, :integer
  	add_column :recipes, :user_id, :integer
  	remove_column :recipes, :ingredients, :string
  	add_column :recipes, :ingredients, :text
  	remove_column :recipes, :directions, :string
  	add_column :recipes, :directions, :text
  end
end

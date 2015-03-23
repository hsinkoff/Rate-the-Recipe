class AddDateToRecipe < ActiveRecord::Migration
  def change
  	add_column :recipes, :publish_date, :datetime
  end
end

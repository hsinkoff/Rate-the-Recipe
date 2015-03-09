class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :recipe_id
      t.string :name
      t.string :ingredients
      t.string :directions
      
      t.timestamps
    end
  end
end

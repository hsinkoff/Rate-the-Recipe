class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :suggestion
      t.integer :user_id
      t.integer :recipe_id
      t.timestamps
    end
  end
end

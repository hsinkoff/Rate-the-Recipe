class ChangeTitleofColumn < ActiveRecord::Migration
  def change
  	remove_column :recipes, :type, :string
  	add_column :recipes, :meal, :string
  end
end

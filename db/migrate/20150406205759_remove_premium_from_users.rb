class RemovePremiumFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :premium?, :boolean
  end
end

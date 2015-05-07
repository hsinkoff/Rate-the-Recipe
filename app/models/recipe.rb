class Recipe < ActiveRecord::Base
  has_one :user
  has_many :suggestions

  validates :name, length: {minimum:2, maximum:25}
  validates :ingredients, :presence => true
  validates :directions, :presence => true

end

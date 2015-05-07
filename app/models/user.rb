class User < ActiveRecord::Base
  has_many :recipes
  has_many :suggestions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_usage

  def set_usage
    self.usage = 1
  end
	
  def premium
    if self.usage >= 10
      true
    else
      false
    end
  end  

end

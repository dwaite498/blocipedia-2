class User < ActiveRecord::Base
  enum role: [:user, :premium, :admin]
  has_many :wikis
  
  def set_default_role
    self.role ||= :user
  end
  
 
  

  before_save {  self.role ||= :user }

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end

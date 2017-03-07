class User < ActiveRecord::Base
  has_many :wikis
  
 
  

  before_save {  self.role ||= :user }

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: [:admin, :user]
end

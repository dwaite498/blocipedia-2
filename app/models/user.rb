class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  enum role: [:user, :premium, :admin]
  
  
  def set_default_role
    self.role ||= :user
  end
  
  def downgrade_account
    self.role = 'user'
    wikis = self.wikis
    wikis.each do |wiki|
      wiki.private = false
    end
  end
  
  before_save {  self.role ||= :user }         
end

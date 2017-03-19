class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborating_users, through: :collaborations, source: :user
  validates :title, length: { minimum: 4 }
  validates :body, length: { minimum: 20 }
  

end

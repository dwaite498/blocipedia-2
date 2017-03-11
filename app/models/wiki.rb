class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { minimum: 4 }
  validates :body, length: { minimum: 20 }
  
  
end

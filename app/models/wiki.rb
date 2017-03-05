class Wiki < ActiveRecord::Base
  validates :title, length: { minimum: 4 }
  validates :body, length: { minimum: 20 }

end

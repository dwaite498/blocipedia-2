class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
  
  def initialize(user, wiki)
    @user = user
    @wikis = wiki
  end
  
  def index?
    current_user.admin
  end
  
  def update?
    user.admin? or wiki.private
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end

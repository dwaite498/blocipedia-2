class WikiPolicy < ApplicationPolicy
  def index?
    user
  end
  
  # def show?
  #   user.admin? || record.user == user
  # end
  
  def update?
    user.present?
  end
  
  def create?
    user.present?
  end
  
  def new?
    user.present?
  end
  
  def destroy?
    user.role == 'admin' || record.user == user
  end
  
  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user == user || wiki.collaborating_users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.collaborating_users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end

end
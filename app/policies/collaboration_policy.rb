class CollaborationPolicy < ApplicationPolicy
  def create?
    user.admin? || user == wiki_owner(record)
  end
  
  def destroy?
    user.admin? || user == wiki_owner(record)
  end
  
  private
  
  def wiki_owner
    Wiki.find(record.wiki_id).user
  end
end
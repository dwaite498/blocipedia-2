module WikisHelper
  
  def wiki_is_private?
    @wiki.user == current_user
  end
  
  def user_is_premium?
    current_user.premium?
  end
end

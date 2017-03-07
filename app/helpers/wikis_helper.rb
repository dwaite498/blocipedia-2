module WikisHelper
  
  def wiki_is_private?
    @wiki.user == current_user
  end
end

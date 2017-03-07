module WikisHelper
  
  def wiki_is_private?
    current_user.id == @wikis.user
  end
end

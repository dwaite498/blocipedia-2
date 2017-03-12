module WikisHelper
  
  def user_is_premium?
    current_user.premium?
  end
end

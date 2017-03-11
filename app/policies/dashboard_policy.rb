class DashboardPolicy < Struct.new(:user, :dashboard)
  def show_premium?
    user && (user.premium?)
  end
  
  def show_user?
    user && user.user?
  end
end
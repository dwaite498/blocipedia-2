class UserPolicy
  attr_reader :current_user, :model
  
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def index?
    @current_user.admin?
  end
  
  def user_not_authorized
    flash[:alert] = "Access Denied"
    redirect_to (request.referrer || root_path)
  end
end
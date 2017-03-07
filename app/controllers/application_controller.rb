class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

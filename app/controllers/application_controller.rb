class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  helper_method :current_user_profile

  private
  def current_user_profile
    @current_user_profile ||= Profile.where(user_id: current_user.id).first
  end

end

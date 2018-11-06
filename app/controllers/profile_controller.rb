class ProfileController < ApplicationController

  respond_to :html, :js
  layout "site"

  before_action :authenticate_user!
  helper_method :resource

  def update
    resource.update_attributes(resource_params)

    respond_with resource, location: profile_path(resource)
  end

  private
  def resource
    @resource ||= Profile.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:firstname, :lastname, :age, :favorite_team, user_attributes: [:id, :password, :password_confirmation])
  end
end

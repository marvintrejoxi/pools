class ScoresController < ApplicationController

  respond_to :html, :js
  layout "site"

  before_action :authenticate_user!
  helper_method :resource
  helper_method :url_form
  helper_method :match


  def create
    resource.assign_attributes(resource_params)
    resource.save

    respond_with resource, location: matches_path
  end

  def update
    resource.update_attributes(resource_params)

    respond_with resource, location: matches_path
  end

  private

  def match
    @match ||= Match.where(id: params[:match_id]).first
  end

  def score
    @score ||= Score.where(id: params[:id], match_id: match.id).first
  end

  def resource
    @resource ||=
      case action_name
      when "new", "create"
        match.scores.build(user_id: current_user.id)
      when "edit", "update"
        score
      end
  end

  def url_form
    @url_form =
    case action_name
      when "new", "create"
        match_scores_path(match)
      when "edit", "update"
        match_score_path(match, score)
      end
  end

  def resource_params
    params.require(:resource).permit(:match_score, :match_id, :id)
  end
end

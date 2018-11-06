module Admin
  class GameResultsController < ApplicationController

    respond_to :html, :js
    layout "site"

    before_action :authenticate_user!
    helper_method :resource
    helper_method :url_form
    helper_method :match

    def create
      resource.assign_attributes(resource_params)
      resource.save

      respond_with resource, location: admin_matches_path
    end

    def update
      resource.update_attributes(resource_params)

      respond_with resource, location: admin_matches_path
    end

    private

    def resource
      @resource ||=
        case action_name
        when "new", "create"
          match.build_game_result
        when "edit", "update"
          match_result
        end
    end

    def match
      @match ||= Match.where(id: params[:match_id]).first
    end

    def match_result
      @match_result ||= GameResult.where(match_id: match.id).first
    end

    def url_form
      @url_form ||=
        case action_name
        when "new", "create"
          admin_match_game_results_path(match)
        when "edit", "update"
          admin_match_game_result_path(match,resource)
        end
    end

    def resource_params
      params.require(:resource).permit(:match_id, :match_result)
    end
  end
end

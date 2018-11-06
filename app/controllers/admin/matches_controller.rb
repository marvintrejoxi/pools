module Admin
  class MatchesController < ApplicationController

    respond_to :html, :js
    layout "site"

    before_action :authenticate_user!
    helper_method :resource
    helper_method :url_form
    helper_method :option_for_select_group
    helper_method :option_for_select_phase
    helper_method :option_for_select_teams

    def create
      resource.assign_attributes(params_resource)
      resource.save

      respond_with resource, location: admin_matches_path
    end

    def update
      resource.update_attributes(params_resource)

      respond_with resource, location: admin_matches_path
    end

    private

    def resource
      @resource ||=
        case action_name
        when "new", "create"
          Match.new
        when "edit", "update"
          Match.find(params[:id])
        else
          Match.include_game_result.order_asc.paginate(:page => params[:page], :per_page => 10)
        end
    end

    def url_form
      @url_form ||=
        case action_name
        when "edit", "update"
          admin_match_path(resource)
        when "create", "new"
          admin_matches_path
        end
    end

    def option_for_select_group
      @option_for_select_group = [
        ["Grupo A", "A"],
        ["Grupo B", "B"],
        ["Grupo C", "C"],
        ["Grupo D", "D"],
        ["Grupo E", "E"],
        ["Grupo F", "F"],
        ["Grupo G", "G"],
        ["Grupo H", "H"]
      ]
    end

    def option_for_select_phase
      @option_for_select_phase = [
        ["Fase de grupos", "Fase de grupos"],
        ["Octavos de final", "Octavos de final"],
        ["Cuartos de final", "Cuartos de final"],
        ["Semifinales", "Semifinales"],
        ["3er y 4to puesto", "3er y 4to puesto"],
        ["Final", "Final"]
      ]
    end

    def option_for_select_teams
      @option_for_select_phase = [
        ["Rusia", "Rusia"],
        ["Uruguay", "Uruguay"],
        ["Egipto", "Egipto"],
        ["Arabia Saudita", "Arabia Saudita"],
        ["Iran", "Iran"],
        ["Portugal", "Portugal"],
        ["España", "España"],
        ["Marruecos", "Marruecos"],
        ["Francia", "Francia"],
        ["Dinamarca", "Dinamarca"],
        ["Australia", "Australia"],
        ["Peru", "Peru"],
        ["Croacia", "Croacia"],
        ["Islandia", "Islandia"],
        ["Argentina", "Argentina"],
        ["Nigeria", "Nigeria"],
        ["Serbia", "Serbia"],
        ["Brasil", "Brasil"],
        ["Suiza", "Suiza"],
        ["Costa Rica", "Costa Rica"],
        ["Mexico", "Mexico"],
        ["Suecia", "Suecia"],
        ["Alemania", "Alemania"],
        ["Belgica", "Belgica"],
        ["Panama", "Panama"],
        ["Tunes", "Tunes"],
        ["Inglatera", "Inglatera"],
        ["Polonia", "Polonia"],
        ["Senegal", "Senegal"],
        ["Colombia", "Colombia"],
        ["Japon", "Japon"]
      ]
    end

    def params_resource
      params.require(:resource).permit(:local_team, :visiting_team, :match_date, :match_hour, :group, :tournamen_phase)
    end
  end
end

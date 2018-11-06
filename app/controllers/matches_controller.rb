class MatchesController < ApplicationController

  layout "site"

  before_action :authenticate_user!
  before_action :set_successful_forecasts!
  before_action :build_user_profile!, only: [:index]
  helper_method :resource


  private

  def resource
    @resource ||= Match.include_scores.order_asc.paginate(:page => params[:page], :per_page => 10)
  end

  def set_successful_forecasts!

    scores_current_user.each do |score|
      successful_forecast = GameResult.where(match_id: score.match_id, match_result: score.match_score).first

      if successful_forecast.present?
        score.update_column(:successful_forecast, true)
        current_user_profile.update_column(:count_successful_forecasts, current_user_profile.count_successful_forecasts+1)
      end
    end

  end

  def scores_current_user
    @scores_current_user ||= Score.only_successful_forecast_false.where(user_id: current_user.id)
  end

  def build_user_profile!
    return if current_user.profile
    current_user.build_profile
    current_user.save
  end

end

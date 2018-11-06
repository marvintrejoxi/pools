class ResultsController < ApplicationController

  layout "site"

  helper_method :matches_colleccion
  helper_method :collection_positions

  def positions

  end

  private
  def matches_colleccion
    @matches_colleccion ||= Match.include_game_result.order_asc.paginate(:page => params[:page], :per_page => 10)
  end

  def collection_positions
    @collection_positions ||= Profile.order_count_successful_forecasts_desc.order_name_asc
  end


end

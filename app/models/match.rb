class Match < ApplicationRecord
  has_many :scores
  has_one :game_result

  scope :order_asc, -> { order(created_at: :desc) }
  scope :include_game_result, -> { includes(:game_result) }
  scope :include_scores, -> { includes(:scores) }

  def teams
    "#{try(:local_team)} vs #{try(:visiting_team)}"
  end

  def has_score? current_user
    self.scores.where(user_id: current_user.id).first.present?
  end

  def score current_user
    self.scores.where(user_id: current_user.id).first rescue ""
  end

  def has_game_result?
    return true if self.game_result.present?
  end

  def match_result
    try(:game_result).try(:match_result)
  end

end

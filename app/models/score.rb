class Score < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates :match_score, presence: true
  validates_format_of :match_score, with: /\d{1}-\d{1}/
  validates :match_id, :uniqueness => {:scope=>:user_id}

  scope :only_successful_forecast_false, -> { where(successful_forecast: false) }
end

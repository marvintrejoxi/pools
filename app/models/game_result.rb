class GameResult < ApplicationRecord
  belongs_to :match

  validates :match_result, presence: true
  validates_format_of :match_result, with: /\d{1}-\d{1}/

  delegate :match_result, to: :match, prefix: true, allow_nil: true

end

class Profile < ApplicationRecord
  belongs_to :user

  accepts_nested_attributes_for :user
  validates :firstname, :lastname, presence: true, on: :update

  delegate :email, to: :user, prefix: true, allow_nil: true

  scope :order_name_asc, -> { order(firstname: :asc) }
  scope :order_count_successful_forecasts_desc, -> { order(count_successful_forecasts: :desc) }

  def full_name
    "#{try(:firstname)} #{try(:lastname)}"
  end

end

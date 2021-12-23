class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :profile

  before_save :calculate_total_value
  validates :motivation, :hours_per_week, :hourly_rate, :hours_per_week, :weeks, presence: true, on: :create
  validates :feed_back, presence: true, on: :update, unless: :skip_validation
  validates :motivation, length: { in: 15..200 }
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 200 }
  validates :hours_per_week, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 40 }
  validates :weeks, numericality: true

  enum status: { draft: 0, accepted: 1, turned_down: 2 }

  private

  def calculate_total_value
    self.total_value = (weeks * hours_per_week).to_i * hourly_rate
  end

  def skip_validation
    Proposal.accepted
  end
end

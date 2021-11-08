class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :profile

  before_save :calculate_total_value
  validates :profile, uniqueness: true, on: :create
  validates :feed_back, presence: true, on: :update, unless: :skip_validation
  
  enum status: { draft: 0, accepted: 1, turned_down: 2 }

  private

  def calculate_total_value
    self.total_value = (weeks * hours_per_week).to_i * hourly_rate
  end

  def skip_validation
    Proposal.accepted
  end
end

class Proposal < ApplicationRecord
  validates :profile, uniqueness: true, on: :create
  validates :feed_back, presence: true, on: :update, unless: :skip_validation
  belongs_to :project
  belongs_to :profile
  enum status: { draft: 0, accepted: 1, turned_down: 2 }

  private

  def skip_validation
    Proposal.accepted
  end
end   
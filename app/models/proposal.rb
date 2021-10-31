class Proposal < ApplicationRecord
  validates :profile, uniqueness: true
  validates :feed_back, presence: true, on: :update
  belongs_to :project
  belongs_to :profile
  enum status: { draft: 0, accepted: 1, turned_down: 2 }
end

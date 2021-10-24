class Proposal < ApplicationRecord
  belongs_to :project
  belongs_to :profile
  enum status: { draft: 0, accepted: 1, turned_down: 2 }
end

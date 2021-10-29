class Proposal < ApplicationRecord
  validates :profile, uniqueness: true
  belongs_to :project
  belongs_to :profile
  enum status: { draft: 0, accepted: 1, turned_down: 2 }
  def dead_line_validation
    if Project.deadline_for_proposals < Date.today
      errors.add(:deadline_for_proposals, 'Data limite para proposta passou')
    end
  end
end

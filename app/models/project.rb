class Project < ApplicationRecord
  validates :title, :description, 
            :desire_habilities, 
            :max_hour_payment, 
            :deadline_for_proposals,
            presence: true
  belongs_to :owner
end

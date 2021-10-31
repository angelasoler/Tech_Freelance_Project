class Project < ApplicationRecord
  validates :title, :description, 
            :desire_habilities, 
            :max_hour_payment, 
            :deadline_for_proposals,
            presence: true
  validate :greater_than_two_months, on: :create
  belongs_to :owner
  has_many :proposals
  
  def greater_than_two_months
    if !deadline_for_proposals.nil?
      if deadline_for_proposals < Date.today + 2.months
        errors.add(:deadline_for_proposals, 'deve ser maior que dois meses.')
      end
    end
  end
end

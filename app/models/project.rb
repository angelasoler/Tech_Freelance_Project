class Project < ApplicationRecord
  validates :title, :description,
            :desire_habilities,
            :max_hour_payment,
            :deadline_for_proposals,
            presence: true
  validate :greater_than_two_months, on: :create
  belongs_to :owner
  has_many :proposals, dependent: :destroy

  private

  def greater_than_two_months
    return unless !deadline_for_proposals.nil? && (deadline_for_proposals < Time.zone.today + 2.months)

    errors.add(:deadline_for_proposals, 'deve ser maior que dois meses.')
  end
end

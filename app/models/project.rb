class Project < ApplicationRecord
  validates :title, :description,
            :desire_habilities,
            :max_hour_payment,
            :deadline_for_proposals,
            presence: true
  validate :greater_than_two_months, on: :create
  validates :title, length: { in: 8..40 }
  validates :description, length: { in: 20..200 }
  validates :max_hour_payment, numericality: { greater_than: 50 }
  validate :type_of_job, on: :create

  belongs_to :owner
  has_many :proposals, dependent: :destroy

  private

  def greater_than_two_months
    return unless !deadline_for_proposals.nil? && (deadline_for_proposals < Time.zone.today + 2.months)

    errors.add(:deadline_for_proposals, 'deve ser maior que dois meses.')
  end

  def type_of_job
    errors.add(:project, 'Escolha ao menos um tipo de trabalho') if !remote? && !face_to_face?
  end
end

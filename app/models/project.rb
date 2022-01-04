class Project < ApplicationRecord
  validates :title, :description,
            :desire_habilities,
            :max_hour_payment,
            :deadline_for_proposals,
            presence: true
  validate :valid_date, :greater_than_two_months, on: :create
  validates :title, length: { in: 8..40 }
  validates :description, length: { in: 20..200 }
  validates :max_hour_payment, numericality: { greater_than: 50 }
  validate :type_of_job, on: :create

  belongs_to :owner
  has_many :proposals, dependent: :destroy

  private

  def greater_than_two_months
    unless deadline_for_proposals &&
           deadline_for_proposals >= Time.zone.today + 2.months
      errors.add(:deadline_for_proposals,
                 I18n.t('greater_than_two_months',
                        scope: 'activerecord.errors.messages'))
    end
  end

  def type_of_job
    errors.add(:project, I18n.t('type_of_job', scope: 'activerecord.errors.messages')) if !remote? && !face_to_face?
  end

  def valid_date
    unless deadline_for_proposals
           .is_a?(Date)
      errors.add(:deadline_for_proposals,
                 I18n.t('valid_date', scope: 'activerecord.errors.messages'))
    end
  end
end
